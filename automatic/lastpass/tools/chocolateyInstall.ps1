$packageArgs = @{
  packageName    = 'lastpass'
  installerType  = 'exe'
  url            = 'https://lastpass.com/download/cdn/lastpass.exe'
  url64          = 'https://lastpass.com/download/cdn/lastpass_x64.exe'
  checksum       = '528278b6a337856e5f88d12c4fc2d63b032c49698c9c7364048b23123f2dd229'
  checksum64     = '5abb4dac6ead5200c26a99c6d3bc962bd8cd95b7d230f93db40855606b1a8b31'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  silentArgs     = '-si --userinstallie --userinstallff --userinstallchrome'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
