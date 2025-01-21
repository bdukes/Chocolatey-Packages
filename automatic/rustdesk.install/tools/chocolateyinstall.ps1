$ErrorActionPreference = 'Stop';

$installedPath = 'C:\Program Files\RustDesk\RustDesk.exe';
if (Test-Path $installedPath) {
  if (Get-Service -Name 'RustDesk' -ErrorAction SilentlyContinue) {
    & $installedPath --uninstall-service;
  }
}

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://github.com/rustdesk/rustdesk/releases/download/1.3.7/rustdesk-1.3.7-x86_64.exe'
  silentArgs     = "--silent-install"
  validExitCodes = @(0)
  checksum       = '8ed553e0d84717feef9513159ac1b0bd07a88245b7e1285538459dded0921575'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs;

if (Test-Path $installedPath) {
  & $installedPath --install-service;
}
