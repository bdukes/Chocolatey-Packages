$ErrorActionPreference = 'Stop';
$toolsDir = Split-Path -Parent $MyInvocation.MyCommand.Definition;
$exeFile = Join-Path $toolsDir 'rustdesk.exe';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName
  fileFullPath = $exeFile
  url          = 'https://github.com/rustdesk/rustdesk/releases/download/1.3.8/rustdesk-1.3.8-x86_64.exe'
  checksum     = '283557e80ee96139c66400b5302b33acad09cb00f88333660db3e1d977abf9ab'
  checksumType = 'sha256'
}

Get-ChocolateyWebFile @packageArgs;
