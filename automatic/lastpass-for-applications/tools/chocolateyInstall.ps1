$packageArgs = @{
  packageName    = 'lastpass-for-applications'
  installerType  = 'exe'
  url            = 'https://download.cloud.lastpass.com/windows_installer/lastappinstall.exe'
  url64          = 'https://download.cloud.lastpass.com/windows_installer/lastappinstall_x64.exe'
  checksum       = '54be5d68597ab349c33cb4061f9b58518d89129381633dc4a80967b5e5524d2a'
  checksum64     = '14ceed77af86f3b51fb0c33f314f278c07d87efbcd1722137c4fe18f20719192'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
