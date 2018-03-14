$packageArgs = @{
  packageName    = 'lastpass'
  installerType  = 'exe'
  url            = 'https://lastpass.com/download/cdn/lastpass.exe'
  url64          = 'https://lastpass.com/download/cdn/lastpass_x64.exe'
  checksum       = 'd83308181fda230ba65dccc74935e2c08af925edbd0fda101a2eaf8212d935ae'
  checksum64     = 'debf0b5817de3ae49fedb882cdf1e4f28b3d92d47964152714233a8c217e8359'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  silentArgs     = '-si --userinstallie --userinstallff --userinstallchrome'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
