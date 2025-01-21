$ErrorActionPreference = 'Stop';
$toolsDir = Split-Path -Parent $MyInvocation.MyCommand.Definition;
$exeFile = Join-Path $toolsDir 'rustdesk.exe';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName
  fileFullPath = $exeFile
  url          = 'https://github.com/rustdesk/rustdesk/releases/download/1.3.7/rustdesk-1.3.7-x86_64.exe'
  checksum     = '8ed553e0d84717feef9513159ac1b0bd07a88245b7e1285538459dded0921575'
  checksumType = 'sha256'
}

Get-ChocolateyWebFile @packageArgs;
