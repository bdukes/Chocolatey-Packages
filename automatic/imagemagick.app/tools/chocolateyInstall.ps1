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
    if (-not $packageParams.InstallOldFFmpeg) {
        $additionalTasks += '!install_FFmpeg'
        # If NOT installing FFmpeg when NOT present, warn of unavailable features. Suggest 'choco install ffmpeg'.
        if (-not (Get-Command ffmpeg -ErrorAction SilentlyContinue)) {
            Write-Warning "FFmpeg is not present on this system and ImageMagick's outdated FFmpeg has not been enabled. Some ImageMagick features will be unavailable. Install FFmpeg via 'choco install ffmpeg'."
        }
    }
    # If FFmpeg is already present, warn user of PATH conflicts
    elseif (Get-Command ffmpeg -ErrorAction SilentlyContinue) {
        Write-Warning "FFmpeg is already present on the system. Installing ImageMagicks's FFmpeg will cause a PATH conflict and ImageMagick's outdated FFmpeg will be selected."
    }

    if ($additionalTasks.length -gt 0) {
        $packageArgs.silentArgs = $packageArgs.silentArgs + ' /MERGETASKS=' + ($additionalTasks -join ',')
    }
}

#Uninstall old version if present
$UninstallKey = $(Get-UninstallRegistryKey -softwareName $packageArgs.softwareName).UninstallString

if ($UninstallKey.count -eq 1) {
    # foreach ($key in $UninstallKey){
        Write-Host "Uninstalling previous version is required for silent upgrade"
        Uninstall-ChocolateyPackage $packageArgs.packageName $packageArgs.installerType $packageArgs.silentArgs $UninstallKey
    # }
}elseif ($UninstallKey.count -gt 1) {
    throw "Uninstallation of the old version was aborted because they are too much uninstall entries. List of entries : $UninstallKey"
}

Write-Verbose "Installing with arguments: $($packageArgs.silentArgs)"
Install-ChocolateyInstallPackage @packageArgs

# Remove the binaries from the tools folder so they do not take up extra space.
Get-ChildItem $toolsDir\*.exe | ForEach-Object { Remove-Item $_ -ErrorAction SilentlyContinue; if (Test-Path $_) { Set-Content "$_.ignore" "" } }
