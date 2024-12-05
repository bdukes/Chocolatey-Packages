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
  url            = 'https://github.com/rustdesk/rustdesk/releases/download/1.3.4/rustdesk-1.3.4-x86_64.exe'
  silentArgs     = "--silent-install"
  validExitCodes = @(0)
  checksum       = '2454d0017268909f5bf81324d03c47b2a8cab5e52cd20d3968020037a9173430'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs;

if (Test-Path $installedPath) {
  & $installedPath --install-service;
}
