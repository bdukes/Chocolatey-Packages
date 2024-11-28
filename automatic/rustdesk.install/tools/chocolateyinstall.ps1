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
  url            = 'https://github.com/rustdesk/rustdesk/releases/download/1.3.3/rustdesk-1.3.3-x86_64.exe'
  silentArgs     = "--silent-install"
  validExitCodes = @(0)
  checksum       = 'fcd49724b1f9e36135e6a1ef0236b701b6f9be19a569626d82245a4043aa9efa'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs;

if (Test-Path $installedPath) {
  & $installedPath --install-service;
}
