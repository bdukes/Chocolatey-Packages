$packageArgs = @{
  packageName    = 'lastpass'
  installerType  = 'exe'
  url            = 'https://lastpass.com/download/cdn/lastpass.exe'
  url64          = 'https://lastpass.com/download/cdn/lastpass_x64.exe'
  checksum       = 'd8c4151397fc3e60c2f11648f977d61aa3bdcfd3aa98ab79266f700d8feafc1d'
  checksum64     = '9c22e49ed472e2103d56672d4f4eb8f39a20347c2b1d9325a95220ca5d6661d4'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  silentArgs     = '-si --userinstallie --userinstallff --userinstallchrome'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
