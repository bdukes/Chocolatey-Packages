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
  url            = 'https://github.com/rustdesk/rustdesk/releases/download/1.3.5/rustdesk-1.3.5-x86_64.exe'
  silentArgs     = "--silent-install"
  validExitCodes = @(0)
  checksum       = '30d13a97c091946a706802e0ec521b6ca31433815ce8f8737454a98d74b0b236'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs;

if (Test-Path $installedPath) {
  & $installedPath --install-service;
}
