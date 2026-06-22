$ErrorActionPreference = 'Stop'

$toolsDir              = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$exeFile               = Join-Path $toolsDir 'rustdesk-qs.exe'

$url                   = 'https://github.com/rustdesk/rustdesk/releases/download/1.4.8/rustdesk-1.4.8-x86-sciter.exe'
$checksum              = '10a14578ed3adbab66bfe5c8daa0d49d07e002d48f69f303966ea349f58dfea7'
$ChecksumType          = 'sha256'
$url64                 = 'https://github.com/rustdesk/rustdesk/releases/download/1.4.8/rustdesk-1.4.8-x86_64.exe'
$checksum64            = 'f0053229fa2a2459c8b86f326c3e7423018a72f010f9758dc21be171b112d1b2'
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
