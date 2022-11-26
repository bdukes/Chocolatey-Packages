$ErrorActionPreference = 'Stop';
$toolsDir = Split-Path -Parent $MyInvocation.MyCommand.Definition;
$zipPath = Join-Path $toolsDir 'rustdesk.zip';

$getWebFileArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileFullPath   = $zipPath
  url            = 'https://github.com/rustdesk/rustdesk/releases/download/1.1.9/rustdesk-1.1.9-windows_x32.zip'
  url64bit       = 'https://github.com/rustdesk/rustdesk/releases/download/1.1.9/rustdesk-1.1.9-windows_x64.zip'
  checksum       = '9d9132a0ac6746024a2436bfb188e081097d833bc47b79a43e3d8c79af4ddefa'
  checksumType   = 'sha256'
  checksum64     = 'a5e857af9424f628cbad72b6b60bba43c5a66a225b493d4573276debf0074496'
  checksumType64 = 'sha256'
}

Get-ChocolateyWebFile @getWebFileArgs;
Get-ChocolateyUnzip -FileFullPath $zipPath -Destination $toolsDir;
Remove-Item $zipPath;

$exeFile = Get-Item "$toolsDir/*.exe";

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  file           = $exeFile
  silentArgs     = "--silent-install"
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs;
Remove-Item $exeFile;
