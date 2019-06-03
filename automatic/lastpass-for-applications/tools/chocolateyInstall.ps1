$packageArgs = @{
  packageName    = 'lastpass-for-applications'
  installerType  = 'exe'
  url            = 'https://download.cloud.lastpass.com/windows_installer/lastappinstall.exe'
  url64          = 'https://download.cloud.lastpass.com/windows_installer/lastappinstall_x64.exe'
  checksum       = '757e5e869721428b3d78bc463baf55e4774cebb44857eb7efb9888876c6f7bd9'
  checksum64     = '8eb3b3579f0f9cb455c6beac0c918a3cb9d694875a63806276c8702f71c3f7ca'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
