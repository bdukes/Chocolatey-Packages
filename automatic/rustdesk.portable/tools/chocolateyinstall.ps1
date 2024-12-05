$ErrorActionPreference = 'Stop';
$toolsDir = Split-Path -Parent $MyInvocation.MyCommand.Definition;
$exeFile = Join-Path $toolsDir 'rustdesk.exe';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName
  fileFullPath = $exeFile
  url          = 'https://github.com/rustdesk/rustdesk/releases/download/1.3.4/rustdesk-1.3.4-x86_64.exe'
  checksum     = '2454d0017268909f5bf81324d03c47b2a8cab5e52cd20d3968020037a9173430'
  checksumType = 'sha256'
}

Get-ChocolateyWebFile @packageArgs;
