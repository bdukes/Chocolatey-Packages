$ErrorActionPreference = 'Stop';
$toolsDir = Split-Path -Parent $MyInvocation.MyCommand.Definition;
$exeFile = Join-Path $toolsDir 'rustdesk.exe';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName
  fileFullPath = $exeFile
  url          = 'https://github.com/rustdesk/rustdesk/releases/download/1.2.2/rustdesk-1.2.2-x86_64.exe'
  checksum     = 'c588654739f6a19adff00fc67550ac9da2e7c7de94009bdea01fd94300d76dcf'
  checksumType = 'sha256'
}

Get-ChocolateyWebFile @packageArgs;
