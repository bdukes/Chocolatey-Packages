$packageArgs = @{
  packageName    = 'lastpass'
  installerType  = 'exe'
  url            = 'https://lastpass.com/download/cdn/lastpass.exe'
  url64          = 'https://lastpass.com/download/cdn/lastpass_x64.exe'
  checksum       = 'b02bc4c9a239b06c2b478b81405ff6b33abbad21424b39bdd49521a140ac59f4'
  checksum64     = '037ab571f9f4a4514df8bcf886c4d184084868c3b232c2d7a9ac7990288a3c12'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  silentArgs     = '-si --userinstallie --userinstallff --userinstallchrome'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
