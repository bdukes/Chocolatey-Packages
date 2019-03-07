$packageArgs = @{
  packageName    = 'lastpass-for-applications'
  installerType  = 'exe'
  url            = 'https://download.cloud.lastpass.com/windows_installer/lastappinstall.exe'
  url64          = 'https://download.cloud.lastpass.com/windows_installer/lastappinstall_x64.exe'
  checksum       = '453be73dc6e29f9c8f5a004c62bf20ab1b0bd997e5f89561a087d88f07409ca3'
  checksum64     = '3bf22156c660d1da0ee736e27c9f86123da0a207de8ee35852b91b320c0394f4'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
