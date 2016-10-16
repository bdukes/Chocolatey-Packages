$packageArgs = @{
  packageName    = 'lastpass-for-applications'
  installerType  = 'exe'
  url            = 'https://lastpass.com/download/cdn/lastappinstall.exe'
  url64          = 'https://lastpass.com/download/cdn/lastappinstall_x64.exe'
  checksum       = ''
  checksum64     = ''
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs