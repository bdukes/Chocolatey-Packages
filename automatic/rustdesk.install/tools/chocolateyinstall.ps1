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
  url            = 'https://github.com/rustdesk/rustdesk/releases/download/1.3.8/rustdesk-1.3.8-x86_64.exe'
  silentArgs     = "--silent-install"
  validExitCodes = @(0)
  checksum       = '283557e80ee96139c66400b5302b33acad09cb00f88333660db3e1d977abf9ab'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs;

if (Test-Path $installedPath) {
  & $installedPath --install-service;
}
