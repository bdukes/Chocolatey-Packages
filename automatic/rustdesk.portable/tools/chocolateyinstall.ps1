$ErrorActionPreference = 'Stop';
$toolsDir = Split-Path -Parent $MyInvocation.MyCommand.Definition;

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName
  fileFullPath = $toolsDir
  url          = 'https://github.com/rustdesk/rustdesk/releases/download/1.2.0/rustdesk-1.2.0-x86_64.exe'
  checksum     = 'e36c78e042c98ee4c5e6030e162b87ecb64f492c948caf2266f7d9397d73cbc5'
  checksumType = 'sha256'
}

Get-ChocolateyWebFile @packageArgs;

$exeFile = Get-Item "$toolsDir/*.exe";
New-Item -Path ($exeFile.FullName + '.ignore') -ItemType File;
Move-Item $exeFile (Join-Path $toolsDir 'rustdesk.exe') -Force;
