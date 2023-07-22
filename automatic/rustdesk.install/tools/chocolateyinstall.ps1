$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://github.com/rustdesk/rustdesk/releases/download/1.2.0/rustdesk-1.2.0-x86_64.exe'
  silentArgs     = "--silent-install"
  validExitCodes = @(0)
  checksum       = 'e36c78e042c98ee4c5e6030e162b87ecb64f492c948caf2266f7d9397d73cbc5'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs;
