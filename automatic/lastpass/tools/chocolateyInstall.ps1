$packageArgs = @{
  packageName    = 'lastpass'
  installerType  = 'exe'
  url            = 'https://lastpass.com/download/cdn/lastpass.exe'
  url64          = 'https://lastpass.com/download/cdn/lastpass_x64.exe'
  checksum       = '927ea42ae037cd1433d8e72774f4481465c8b737d87cb94167e877ea620e2f85'
  checksum64     = '5d4bcf0dfbc30be5d821b1ac9344d8fdc7ef67e3884e38048fc5248f27e2ab1e'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  silentArgs     = '-si --userinstallie --userinstallff --userinstallchrome'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
