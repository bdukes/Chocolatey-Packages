$ErrorActionPreference = 'Stop';
$toolsDir = Split-Path -Parent $MyInvocation.MyCommand.Definition;
$zipPath = Join-Path $toolsDir 'rustdesk.zip';

$getWebFileArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileFullPath   = $zipPath
  url            = 'https://github.com/rustdesk/rustdesk/releases/download/1.1.9/rustdesk-1.1.9-windows_x32.zip'
  url64bit       = 'https://github.com/rustdesk/rustdesk/releases/download/1.1.9/rustdesk-1.1.9-windows_x64.zip'
  checksum       = '2de97784d77a5e7268ba777c3005f98d7549e148dfc9bbed81211c049db0a71f'
  checksumType   = 'sha256'
  checksum64     = 'c6fc4d9099e38a654fa364cf57c6128eb4d6186d7444a5d0b3a714b58d0641b7'
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
