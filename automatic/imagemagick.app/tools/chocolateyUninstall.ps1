$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $Env:ChocolateyPackageName
  installerType  = 'exe'
  silentArgs     = '/VERYSILENT'
  validExitCodes = @(0)
  softwareName   = 'ImageMagick*'
}
   
$UninstallKey = $(Get-UninstallRegistryKey -softwareName $packageArgs.softwareName).UninstallString

if ($UninstallKey.count -eq 1) {
        Uninstall-ChocolateyPackage $packageArgs.packageName $packageArgs.installerType $packageArgs.silentArgs $UninstallKey
}elseif ($UninstallKey.count -gt 1) {
    throw "Uninstallation was aborted because they are too much uninstall entries. List of entries : $UninstallKey"
}