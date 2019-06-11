$packageArgs = @{
  packageName    = 'lastpass-for-applications'
  installerType  = 'exe'
  url            = 'https://download.cloud.lastpass.com/windows_installer/lastappinstall.exe'
  url64          = 'https://download.cloud.lastpass.com/windows_installer/lastappinstall_x64.exe'
  checksum       = 'c2bc7cd40e0ae7c0aa4cc3bf09644e7f584b29d648415150efff4fb85609f638'
  checksum64     = 'd5bf46efeea9ee4b63ff3ceba5a6db6518e4f8764d51fd9f90e35b3f9fef33ae'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
