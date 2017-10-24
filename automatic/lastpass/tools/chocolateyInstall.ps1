$packageArgs = @{
  packageName    = 'lastpass'
  installerType  = 'exe'
  url            = 'https://lastpass.com/download/cdn/lastpass.exe'
  url64          = 'https://lastpass.com/download/cdn/lastpass_x64.exe'
  checksum       = '379a2a6327d89cf8f42f0871835c5f37fe37def6503ddb9b7855299b4d8b3b9a'
  checksum64     = '0910f9169bf81d0c7e926550dcb56303d730221ea4a1370061e28777011cf231'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  silentArgs     = '-si --userinstallie --userinstallff --userinstallchrome'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
