$packageArgs = @{
  packageName    = 'lastpass-for-applications'
  installerType  = 'exe'
  url            = 'https://lastpass.com/download/cdn/lastappinstall.exe'
  url64          = 'https://lastpass.com/download/cdn/lastappinstall_x64.exe'
  checksum       = '8d8730573c393eebcea04db11bf48bc6d66e6e84007c21f6af679150f87ea3b6'
  checksum64     = '01095227e75a849006558a3e6b3e6bdb40976c5bd1e8496ecddebd6b33d22004'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
