$ErrorActionPreference = 'Stop';
$toolsDir = Split-Path -Parent $MyInvocation.MyCommand.Definition;
$exeFile = Join-Path $toolsDir 'rustdesk.exe';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName
  fileFullPath = $exeFile
  url          = 'https://github.com/rustdesk/rustdesk/releases/download/1.3.9/rustdesk-1.3.9-x86_64.exe'
  checksum     = 'd306e1634f82fd5fdadd49f06d81484b9f31ac84e61efc65d722e9cf5fe297c5'
  checksumType = 'sha256'
}

Get-ChocolateyWebFile @packageArgs;
