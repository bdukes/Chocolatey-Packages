$ErrorActionPreference = 'Stop';
$toolsDir = Split-Path -Parent $MyInvocation.MyCommand.Definition;
$exeFile = Join-Path $toolsDir 'rustdesk.exe';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName
  fileFullPath = $exeFile
  url          = 'https://github.com/rustdesk/rustdesk/releases/download/1.2.3/rustdesk-1.2.3-x86_64.exe'
  checksum     = '23b661d7bc171cd500d5096456905283ffe06479582b62d3bd5066633935d43e'
  checksumType = 'sha256'
}

Get-ChocolateyWebFile @packageArgs;
