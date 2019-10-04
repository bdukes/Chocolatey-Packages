$packageArgs = @{
  packageName    = 'lastpass-for-applications'
  installerType  = 'exe'
  url            = 'https://download.cloud.lastpass.com/windows_installer/lastappinstall.exe'
  url64          = 'https://download.cloud.lastpass.com/windows_installer/lastappinstall_x64.exe'
  checksum       = '3d3e4fc2476de5a8b4d34c8d0878a9769f8a52f6c42485aef20fe6d80ee92198'
  checksum64     = '8b76b6896880fb429607b3e079a288fc6af16e960f63cde82e3555f59288d76b'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
