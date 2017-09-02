$packageArgs = @{
  packageName    = 'lastpass-for-applications'
  installerType  = 'exe'
  url            = 'https://lastpass.com/download/cdn/lastappinstall.exe'
  url64          = 'https://lastpass.com/download/cdn/lastappinstall_x64.exe'
  checksum       = '4c6bed38513f01aed7416fd49485ba97b228e245e6a2248e60bbdae6808894e1'
  checksum64     = '29cb9f2e69cfed90dcefbec8a13615ba7db9c1b74ae6effad1d0e0a078a30bb9'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
