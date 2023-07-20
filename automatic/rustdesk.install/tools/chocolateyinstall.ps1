$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://github.com/rustdesk/rustdesk/releases/download/1.2.1/rustdesk-1.2.1-x86_64.exe'
  silentArgs     = "--silent-install"
  validExitCodes = @(0)
  checksum       = 'd5ca8a2127e4803d0a742501ee10f6aac6569b81721333ea557e874dfa1a3f47'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs;
