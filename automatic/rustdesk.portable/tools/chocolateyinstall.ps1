$ErrorActionPreference = 'Stop';
$toolsDir = Split-Path -Parent $MyInvocation.MyCommand.Definition;
$exeFile = Join-Path $toolsDir 'rustdesk.exe';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName
  fileFullPath = $exeFile
  url          = 'https://github.com/rustdesk/rustdesk/releases/download/1.2.7/rustdesk-1.2.7-x86_64.exe'
  checksum     = 'd86b4dac7fd5ed52de72186246a8c61a14a7d118004eb6a7b60aec95646f7a01'
  checksumType = 'sha256'
}

Get-ChocolateyWebFile @packageArgs;
