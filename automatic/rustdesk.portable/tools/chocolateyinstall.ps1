$ErrorActionPreference = 'Stop'

$toolsDir              = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$exeFile               = Join-Path $toolsDir 'rustdesk-qs.exe'

$url                   = 'https://github.com/rustdesk/rustdesk/releases/download/1.4.1/rustdesk-1.4.1-x86-sciter.exe'
$checksum              = '76720e622e36bc36a1e594d706f2abc3647931ba59709d2ba9dc15d0354314be'
$ChecksumType          = 'sha256'
$url64                 = 'https://github.com/rustdesk/rustdesk/releases/download/1.4.1/rustdesk-1.4.1-x86_64.exe'
$checksum64            = 'ba5af57afc8e97381af7201ee35b202aa62f5b162863d9135a3a8908f32ff08a'
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
