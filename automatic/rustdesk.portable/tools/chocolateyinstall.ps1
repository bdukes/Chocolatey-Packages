$ErrorActionPreference = 'Stop';
$toolsDir = Split-Path -Parent $MyInvocation.MyCommand.Definition;
$exeFile = Join-Path $toolsDir 'rustdesk.exe';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName
  fileFullPath = $exeFile
  url          = 'https://github.com/rustdesk/rustdesk/releases/download/1.3.5/rustdesk-1.3.5-x86_64.exe'
  checksum     = '30d13a97c091946a706802e0ec521b6ca31433815ce8f8737454a98d74b0b236'
  checksumType = 'sha256'
}

Get-ChocolateyWebFile @packageArgs;
