$packageArgs = @{
  packageName    = 'lastpass-for-applications'
  installerType  = 'exe'
  url            = 'https://download.cloud.lastpass.com/windows_installer/lastappinstall.exe'
  url64          = 'https://download.cloud.lastpass.com/windows_installer/lastappinstall_x64.exe'
  checksum       = 'd72686544b24613305eccfd209c6bcf7379842b54e0611d366fe821e58ce6913'
  checksum64     = '27155d60086a93089e4c5ae078451ef86bcb22eb11e65d66b12741ed36a2804c'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
