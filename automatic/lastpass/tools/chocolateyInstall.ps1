$packageArgs = @{
  packageName    = 'lastpass'
  installerType  = 'exe'
  url            = 'https://download.cloud.lastpass.com/windows_installer/LastPassInstaller.exe'
  url64          = 'https://download.cloud.lastpass.com/windows_installer/LastPassInstaller.exe'
  checksum       = '31a6c48c71c80acb29ca5a9ed42760d6b30e4438a7a47391424ee1efc65f96a0'
  checksum64     = '31a6c48c71c80acb29ca5a9ed42760d6b30e4438a7a47391424ee1efc65f96a0'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  silentArgs     = '-si --userinstallie --userinstallff --userinstallchrome'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
