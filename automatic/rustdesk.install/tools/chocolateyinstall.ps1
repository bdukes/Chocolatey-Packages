$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://github.com/rustdesk/rustdesk/releases/download/1.2.3/rustdesk-1.2.3-x86_64.exe'
  silentArgs     = "--silent-install"
  validExitCodes = @(0)
  checksum       = '0856e5c8c3ee94edfddb80be160ee6857ab72d972065be86783af2c907a7cd54'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs;
