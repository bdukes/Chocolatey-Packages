$ErrorActionPreference = 'Stop';
$toolsDir = Split-Path -parent $MyInvocation.MyCommand.Definition;

$packageArgs = @{
  packageName    = $env:chocolateyPackageName
  installerType  = 'exe'
  file           = Get-Item $toolsDir\*_x32.exe
  file64         = Get-Item $toolsDir\*_x64.exe
  silentArgs     = '/VERYSILENT'
  validExitCodes = @(0)
  softwareName   = 'ImageMagick*'
}

if ($env:chocolateyPackageParameters) {
    $packageParams = ConvertFrom-StringData $env:chocolateyPackageParameters.Replace(" ", "`n");
    $additionalTasks = @();
    if ($packageParams.InstallDevelopmentHeaders) {
        $additionalTasks += 'install_devel';
    }
    if ($packageParams.NoDesktop) {
        $additionalTasks += '!desktop_icon';
    }

    if ($additionalTasks.length -gt 0) {
        $packageArgs.silentArgs = $packageArgs.silentArgs + ' /MERGETASKS=' + ($additionalTasks -join ',');
    }
}

try {
    # Uninstall older version of imagemagick, otherwise the installation won’t be silent.
    $regPath = 'HKLM:\SOFTWARE\ImageMagick\Current';
    if ($env:chocolateyForceX86) {
        $regPath = 'HKLM:\SOFTWARE\Wow6432Node\ImageMagick\Current';
    }
    if (Test-Path $regPath) {
        $uninstallPath = (Get-ItemProperty -Path $regPath).BinPath;
        $uninstallFilePath = "$uninstallPath\unins000.exe";
        Uninstall-ChocolateyPackage $packageArgs.packageName $packageArgs.installerType $packageArgs.silentArgs $uninstallFilePath;
    }
} catch {
    Write-Warning "$packageName uninstallation failed, with message $($_.Exception.Message)";
    Write-Warning "$packageName installation may not be silent";
}

Write-Verbose "Installing with arguments: $($packageArgs.silentArgs)";
Install-ChocolateyInstallPackage @packageArgs;

# Remove the binaries from the tools folder so they do not take up extra space.
Get-ChildItem $toolsDir\*.exe | ForEach-Object { Remove-Item $_ -ErrorAction SilentlyContinue; if (Test-Path $_) { Set-Content "$_.ignore" "" } };
