$ErrorActionPreference = 'Stop';
$toolsDir              = Split-Path -parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $Env:ChocolateyPackageName
  installerType  = 'exe'
  file           = Get-Item $toolsDir\*_x32.exe
  file64         = Get-Item $toolsDir\*_x64.exe
  silentArgs     = '/VERYSILENT'
  validExitCodes = @(0)
  softwareName   = 'ImageMagick*'
}

if ($env:chocolateyPackageParameters) {
    $packageParams = ConvertFrom-StringData $env:chocolateyPackageParameters.Replace(" ", "`n")
    $additionalTasks = @()
    if ($packageParams.InstallDevelopmentHeaders) {
        $additionalTasks += 'install_devel'
    }
    if ($packageParams.LegacySupport) {
        $additionalTasks += 'legacy_support'
    }
    if ($packageParams.NoDesktop) {
        $additionalTasks += '!desktop_icon'
    }
    if ($false -eq $(packageParams.InstallOldFFmpeg) {
        $additionalTasks += '!install_FFmpeg'
        # If FFmpeg is already present, warn user of PATH conflicts
        if ($null -eq -not $(Get-Command ffmpeg)) {
            Write-Warning "FFmpeg is already present on the system. Installing ImageMagicks's FFmpeg will cause a PATH conflict and ImageMagick's outdated FFmpeg will be selected."
        }
    }
    # If NOT installing FFmpeg when NOT present, warn of unavailable features. Suggest 'choco install ffmpeg'.
    elseif ($null -eq $(Get-Command ffmpeg)){
        Write-Warning "FFmpeg is not present on this system and ImageMagick's outdated FFmpeg has not been enabled. Some ImageMagick features will be unavailable. Install FFmpeg via 'choco install ffmpeg'."
    }
    
    if ($additionalTasks.length -gt 0) {
        $packageArgs.silentArgs = $packageArgs.silentArgs + ' /MERGETASKS=' + ($additionalTasks -join ',')
    }
}

try {
    # Uninstall older version of imagemagick, otherwise the installation won't be silent.
    $regPath = 'HKLM:\SOFTWARE\ImageMagick\Current'
    if ($env:chocolateyForceX86) {
        $regPath = 'HKLM:\SOFTWARE\Wow6432Node\ImageMagick\Current'
    }
    if (Test-Path $regPath) {
        $uninstallPath = (Get-ItemProperty -Path $regPath).BinPath
        $uninstallFilePath = "$uninstallPath\unins000.exe"
        Uninstall-ChocolateyPackage $packageArgs.packageName $packageArgs.installerType $packageArgs.silentArgs $uninstallFilePath
    }
} catch {
    Write-Warning "$packageName uninstallation failed, with message $($_.Exception.Message)"
    Write-Warning "$packageName installation may not be silent"
}

Write-Verbose "Installing with arguments: $($packageArgs.silentArgs)"
Install-ChocolateyInstallPackage @packageArgs

# Remove the binaries from the tools folder so they do not take up extra space.
Get-ChildItem $toolsDir\*.exe | ForEach-Object { Remove-Item $_ -ErrorAction SilentlyContinue; if (Test-Path $_) { Set-Content "$_.ignore" "" } }
