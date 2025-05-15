$ErrorActionPreference = 'Stop'

$url64                 = 'https://github.com/rustdesk/rustdesk/releases/download/1.4.0/rustdesk-1.4.0-x86_64.msi'
$checksum64            = '0207c07e89f2c1ebfc239db8b3c2bc5c48db3992931af72d23faf9eb57908dd2'
$ChecksumType64        = 'sha256'

$installedPath = 'C:\Program Files\RustDesk\rustdesk.exe'
if (Test-Path $installedPath) {
    & $installedPath --uninstall
}

$packageArgs = @{
  packageName           = $env:ChocolateyPackageName
  fileType              = 'msi'
  url                   = $url
  url64                 = $url64
  checksum              = $checksum
  checksum64            = $checksum64
  checksumType          = $checksumType
  checksumType64        = $checksumType64
  silentArgs            = "/q /norestart"
  validExitCodes        = @(0)
}

Install-ChocolateyPackage @packageArgs

if (Test-Path $installedPath) {
  & $installedPath --install-service
}
