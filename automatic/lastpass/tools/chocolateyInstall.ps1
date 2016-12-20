$packageArgs = @{
  packageName    = 'lastpass'
  installerType  = 'exe'
  url            = 'https://lastpass.com/download/cdn/lastpass.exe'
  url64          = 'https://lastpass.com/download/cdn/lastpass_x64.exe'
  checksum       = '637AF0DD651ED391D6D48BCE56ED22E75EAC66FB10553C5A9214CB9CC52E6C64'
  checksum64     = '7E3ADEAA631A7A0F4F1E5EF734AB46BC09A6C15510C53370EC2FA63696DA4607'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  silentArgs     = '-si --userinstallie --userinstallff --userinstallchrome'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs