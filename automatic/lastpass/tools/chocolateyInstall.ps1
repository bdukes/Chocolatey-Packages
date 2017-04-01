$packageArgs = @{
  packageName    = 'lastpass'
  installerType  = 'exe'
  url            = 'https://lastpass.com/download/cdn/lastpass.exe'
  url64          = 'https://lastpass.com/download/cdn/lastpass_x64.exe'
  checksum       = 'a4154f88c8c660e971305026c3a873c5e9b51bc40345a0a163329d8a825eb74a'
  checksum64     = 'b2d4689ab6070ffedbb3517fcbb99a98ba5abcbb3f3bf3fc52c3d1eb060c4000'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  silentArgs     = '-si --userinstallie --userinstallff --userinstallchrome'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
