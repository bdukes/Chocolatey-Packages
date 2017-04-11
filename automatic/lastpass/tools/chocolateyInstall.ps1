$packageArgs = @{
  packageName    = 'lastpass'
  installerType  = 'exe'
  url            = 'https://lastpass.com/download/cdn/lastpass.exe'
  url64          = 'https://lastpass.com/download/cdn/lastpass_x64.exe'
  checksum       = 'AC268FAABF8A1190AD085E4291FFF9C7BBB5E8FB7E531B96426835524E463153'
  checksum64     = 'B2A9EE5DE5F78D1897F3F8DB144C84585CBFC994AFFA1051E4783B2C8608B8F5'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  silentArgs     = '-si --userinstallie --userinstallff --userinstallchrome'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
