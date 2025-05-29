$ErrorActionPreference = 'Stop'

$url64                 = 'https://github.com/rustdesk/rustdesk/releases/download/1.4.0/rustdesk-1.4.0-x86_64.msi'
$checksum64            = '0207c07e89f2c1ebfc239db8b3c2bc5c48db3992931af72d23faf9eb57908dd2'
$ChecksumType64        = 'sha256'

$packageArgs = @{
  packageName           = $env:ChocolateyPackageName
  fileType              = 'msi'
  url64                 = $url64
  checksum64            = $checksum64
  checksumType64        = $checksumType64
  silentArgs            = "/qn /norestart"
  validExitCodes        = @(0, 3010)
}

Install-ChocolateyPackage @packageArgs
