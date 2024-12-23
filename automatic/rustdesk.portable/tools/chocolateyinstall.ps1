$ErrorActionPreference = 'Stop';
$toolsDir = Split-Path -Parent $MyInvocation.MyCommand.Definition;
$exeFile = Join-Path $toolsDir 'rustdesk.exe';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName
  fileFullPath = $exeFile
  url          = 'https://github.com/rustdesk/rustdesk/releases/download/1.3.6/rustdesk-1.3.6-x86_64.exe'
  checksum     = '0263b7d994498ecdeb4c8564762e0c59c239031e23e2104dced98ff0537e0b9a'
  checksumType = 'sha256'
}

Get-ChocolateyWebFile @packageArgs;
