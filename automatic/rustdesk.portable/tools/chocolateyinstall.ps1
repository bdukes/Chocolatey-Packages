$ErrorActionPreference = 'Stop';
$toolsDir = Split-Path -Parent $MyInvocation.MyCommand.Definition;
$exeFile = Join-Path $toolsDir 'rustdesk.exe';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName
  fileFullPath = $exeFile
  url          = 'https://github.com/rustdesk/rustdesk/releases/download/1.3.1/rustdesk-1.3.1-x86_64.exe'
  checksum     = 'fc20fd159eea217fa8ba30309aef177ec00913007f42b325e6b7dd1f21a2f245'
  checksumType = 'sha256'
}

Get-ChocolateyWebFile @packageArgs;
