$packageArgs = @{
  packageName    = 'lastpass-for-applications'
  installerType  = 'exe'
  url            = 'https://download.cloud.lastpass.com/windows_installer/lastappinstall.exe'
  url64          = 'https://download.cloud.lastpass.com/windows_installer/lastappinstall_x64.exe'
  checksum       = '94c547eccc542fb13123f21bf935981ba0b73fa935d5063ed03a04fac3404a8c'
  checksum64     = '77c78a89052a92a3efad368ddab7a27d77b213f4581d0f2fec4f415f8794175a'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
