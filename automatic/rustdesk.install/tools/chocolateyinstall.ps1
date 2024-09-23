$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://github.com/rustdesk/rustdesk/releases/download/1.3.1/rustdesk-1.3.1-x86_64.exe'
  silentArgs     = "--silent-install"
  validExitCodes = @(0)
  checksum       = 'fc20fd159eea217fa8ba30309aef177ec00913007f42b325e6b7dd1f21a2f245'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs;

$installedPath = 'C:\Program Files\RustDesk\RustDesk.exe';
if (Test-Path $installedPath) {
  & $installedPath --install-service;
}
