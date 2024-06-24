$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://github.com/rustdesk/rustdesk/releases/download/1.2.6/rustdesk-1.2.6-x86_64.exe'
  silentArgs     = "--silent-install"
  validExitCodes = @(0)
  checksum       = '9a0420bebf85e06fe23c974465d461d06a94a30582b0e643c1e642aebec0a952'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs;
