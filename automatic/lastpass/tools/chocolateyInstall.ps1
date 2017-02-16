$packageArgs = @{
  packageName    = 'lastpass'
  installerType  = 'exe'
  url            = 'https://lastpass.com/download/cdn/lastpass.exe'
  url64          = 'https://lastpass.com/download/cdn/lastpass_x64.exe'
  checksum       = '78d6cdbd3289632052082b348fce311c44d1560f6b57a281e91db89ed7f88730'
  checksum64     = '66ccb8325b4d45cc0d53ce897691a3f3208c5d375346819d086a87b1d2df0eb9'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  silentArgs     = '-si --userinstallie --userinstallff --userinstallchrome'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
