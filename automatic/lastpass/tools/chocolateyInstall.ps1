$packageArgs = @{
  packageName    = 'lastpass'
  installerType  = 'exe'
  url            = 'https://download.cloud.lastpass.com/windows_installer/lastpass.exe'
  url64          = 'https://download.cloud.lastpass.com/windows_installer/lastpass_x64.exe'
  checksum       = 'b174a772acc5def1a9f70fd67af74e0fa9b36ff31f65445554a95698c66c1917'
  checksum64     = 'ea089b68199e0ec18b58bf6a784f7003138a1ba513f7a05b52c762a538c1a105'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  silentArgs     = '-si --userinstallie --userinstallff --userinstallchrome'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
