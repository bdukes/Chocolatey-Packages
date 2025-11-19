$ErrorActionPreference = 'Stop'

$toolsDir              = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$exeFile               = Join-Path $toolsDir 'rustdesk-qs.exe'

$url                   = 'https://github.com/rustdesk/rustdesk/releases/download/1.4.4/rustdesk-1.4.4-x86-sciter.exe'
$checksum              = 'fa602089fe86db2021ac226eafa13fbcbd71767851010483345977f62db90f0f'
$ChecksumType          = 'sha256'
$url64                 = 'https://github.com/rustdesk/rustdesk/releases/download/1.4.4/rustdesk-1.4.4-x86_64.exe'
$checksum64            = '2ed35b0465fc3de72b0757e84daac278619edc30e651e6257073dceae5085332'
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
