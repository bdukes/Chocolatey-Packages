$ErrorActionPreference = 'Stop';
$toolsDir = Split-Path -Parent $MyInvocation.MyCommand.Definition;
$exeFile = Join-Path $toolsDir 'rustdesk.exe';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName
  fileFullPath = $exeFile
  url          = 'https://github.com/rustdesk/rustdesk/releases/download/1.2.2/rustdesk-1.2.2-x86_64.exe'
  checksum     = '7D8790E65A906706A93734B91EFA6DFDB732F9897E04707233FE48033BD5654E'
  checksumType = 'sha256'
}

Get-ChocolateyWebFile @packageArgs;
