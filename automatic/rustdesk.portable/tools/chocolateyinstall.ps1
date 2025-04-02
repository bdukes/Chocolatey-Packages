$ErrorActionPreference = 'Stop';
$toolsDir = Split-Path -Parent $MyInvocation.MyCommand.Definition;
$exeFile = Join-Path $toolsDir 'rustdesk.exe';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName
  fileFullPath = $exeFile
  url          = 'https://github.com/rustdesk/rustdesk/releases/download/1.3.9/rustdesk-1.3.9-x86_64.exe'
  checksum     = 'df37d49857727733ccefc661d9ccb7a848a586bdac3781c976287004a8ffc417'
  checksumType = 'sha256'
}

Get-ChocolateyWebFile @packageArgs;
