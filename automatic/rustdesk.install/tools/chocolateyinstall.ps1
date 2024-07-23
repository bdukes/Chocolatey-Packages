$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://github.com/rustdesk/rustdesk/releases/download/1.2.7/rustdesk-1.2.7-x86_64.exe'
  silentArgs     = "--silent-install"
  validExitCodes = @(0)
  checksum       = 'd86b4dac7fd5ed52de72186246a8c61a14a7d118004eb6a7b60aec95646f7a01'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs;
