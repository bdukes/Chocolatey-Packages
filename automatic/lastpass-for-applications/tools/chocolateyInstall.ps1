$packageArgs = @{
  packageName    = 'lastpass-for-applications'
  installerType  = 'exe'
  url            = 'https://lastpass.com/download/cdn/lastappinstall.exe'
  url64          = 'https://lastpass.com/download/cdn/lastappinstall_x64.exe'
  checksum       = '35938e86dc6bc91e481d7fb7538d13c2176895cd9960c3f62422829730c6a3b7'
  checksum64     = '97e85c7c6f61e831ebc70ad7cdb96768b3e875f3719e84bb05b5b9fd3c55daa9'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
