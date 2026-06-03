$ErrorActionPreference = 'Stop'

$toolsDir              = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$exeFile               = Join-Path $toolsDir 'rustdesk-qs.exe'

$url                   = 'https://github.com/rustdesk/rustdesk/releases/download/1.4.7/rustdesk-1.4.7-x86-sciter.exe'
$checksum              = 'b64a0b75678678e9bf7c501c5eed24005a5814f8d8cac6b6b67df973a03de22d'
$ChecksumType          = 'sha256'
$url64                 = 'https://github.com/rustdesk/rustdesk/releases/download/1.4.7/rustdesk-1.4.7-x86_64.exe'
$checksum64            = 'd3af4216c653e6ac0a98810dc59080ea26fb03045b79dbb6f859f3c954402c9f'
$ChecksumType64        = 'sha256'

$packageArgs = @{
  packageName           = $env:ChocolateyPackageName
  fileFullPath          = $exeFile
  url                   = $url
  url64                 = $url64
  checksum              = $checksum
  checksum64            = $checksum64
  checksumType          = $checksumType
  checksumType64        = $checksumType64
}

Get-ChocolateyWebFile @packageArgs
