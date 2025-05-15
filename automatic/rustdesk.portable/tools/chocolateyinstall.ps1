$ErrorActionPreference = 'Stop';
$toolsDir = Split-Path -Parent $MyInvocation.MyCommand.Definition;
$exeFile = Join-Path $toolsDir 'rustdesk.exe';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName
  fileFullPath = $exeFile
  url          = 'https://github.com/rustdesk/rustdesk/releases/download/1.4.0/rustdesk-1.4.0-x86_64.exe'
  checksum     = '118d2ca9c9388a7f781ae56c0bfe1e765e7c3272312bea5569b4cb5710d8c419'
  checksumType = 'sha256'
}

Get-ChocolateyWebFile @packageArgs;
