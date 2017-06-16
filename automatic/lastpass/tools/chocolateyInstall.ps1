$packageArgs = @{
  packageName    = 'lastpass'
  installerType  = 'exe'
  url            = 'https://lastpass.com/download/cdn/lastpass.exe'
  url64          = 'https://lastpass.com/download/cdn/lastpass_x64.exe'
  checksum       = '92740674db24b3c46b0f4c41b25686375d66f44356f7779146e52a7c65ef8400'
  checksum64     = 'b175fb00bb9c5fdc6fb1cb748747a729b5abff09a99b8a64cc9bf44a697bc493'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  silentArgs     = '-si --userinstallie --userinstallff --userinstallchrome'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
