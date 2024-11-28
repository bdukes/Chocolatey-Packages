$ErrorActionPreference = 'Stop';
$toolsDir = Split-Path -Parent $MyInvocation.MyCommand.Definition;
$exeFile = Join-Path $toolsDir 'rustdesk.exe';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName
  fileFullPath = $exeFile
  url          = 'https://github.com/rustdesk/rustdesk/releases/download/1.3.3/rustdesk-1.3.3-x86_64.exe'
  checksum     = 'fcd49724b1f9e36135e6a1ef0236b701b6f9be19a569626d82245a4043aa9efa'
  checksumType = 'sha256'
}

Get-ChocolateyWebFile @packageArgs;
