$ErrorActionPreference = 'Stop';
$toolsDir = Split-Path -Parent $MyInvocation.MyCommand.Definition;
$exeFile = Join-Path $toolsDir 'rustdesk.exe';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName
  fileFullPath = $exeFile
  url          = 'https://github.com/rustdesk/rustdesk/releases/download/1.3.2/rustdesk-1.3.2-x86_64.exe'
  checksum     = '465e3cc0befa33ef54db3819d224e19cffe684cfe687c76b43352f5bb9c2d87e'
  checksumType = 'sha256'
}

Get-ChocolateyWebFile @packageArgs;
