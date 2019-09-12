$packageArgs = @{
  packageName    = 'lastpass-for-applications'
  installerType  = 'exe'
  url            = 'https://download.cloud.lastpass.com/windows_installer/lastappinstall.exe'
  url64          = 'https://download.cloud.lastpass.com/windows_installer/lastappinstall_x64.exe'
  checksum       = '948e22edce40f00b85dc86924cc4090ce8bf8e73bd8e1a4bc082196a4b58fd3e'
  checksum64     = '329a9a4a2a1a71684da6c4dd4c2df0757328447df8ef36c06f48059d6eae7ac6'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
