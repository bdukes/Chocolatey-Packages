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

Write-Verbose "Installing with arguments: $($packageArgs.silentArgs)";
Install-ChocolateyInstallPackage @packageArgs;

# Remove the binaries from the tools folder so they do not take up extra space.
Get-ChildItem $toolsDir\*.exe | ForEach-Object { Remove-Item $_ -ErrorAction SilentlyContinue; if (Test-Path $_) { Set-Content "$_.ignore" "" } };
