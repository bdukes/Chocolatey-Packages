$ErrorActionPreference = 'Stop';
$toolsDir = Split-Path -Parent $MyInvocation.MyCommand.Definition;
$exeFile = Join-Path $toolsDir 'rustdesk.exe';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName
  fileFullPath = $exeFile
  url          = 'https://github.com/rustdesk/rustdesk/releases/download/1.3.0/rustdesk-1.3.0-x86_64.exe'
  checksum     = '79da93dcd5f2977ec43742d79c2cab9a3c1a54229ca2552130d208dea74f5221'
  checksumType = 'sha256'
}

Get-ChocolateyWebFile @packageArgs;
