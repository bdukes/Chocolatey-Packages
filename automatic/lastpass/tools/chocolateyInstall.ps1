$packageArgs = @{
  packageName    = 'lastpass'
  installerType  = 'exe'
  url            = 'https://lastpass.com/download/cdn/lastpass.exe'
  url64          = 'https://lastpass.com/download/cdn/lastpass_x64.exe'
  checksum       = 'E328A0EEFFB63E54A3EC5B5F837F492FDE548934334B45FB6467AF7D4E4DFDFA'
  checksum64     = 'EE58194D43E66011A1621446F749EE5774B88C24C29A129174448147ECECD213'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  silentArgs     = '-si --userinstallie --userinstallff --userinstallchrome'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
