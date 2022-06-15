$ErrorActionPreference = 'Stop';
$toolsDir = Split-Path -Parent $MyInvocation.MyCommand.Definition;

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  url            = 'https://github.com/rustdesk/rustdesk/releases/download/1.1.9/rustdesk-1.1.9-windows_x32-portable.zip'
  url64bit       = 'https://github.com/rustdesk/rustdesk/releases/download/1.1.9/rustdesk-1.1.9-windows_x64-portable.zip'
  checksum       = '7b8111bb2cf1e0e762a23a7ed82444d52831be7180bcc6e888b7fa5bb9987c40'
  checksumType   = 'sha256'
  checksum64     = '82fc31db2ff28dc07e0cb2a7c59f3f63bb624b0f0b03f3f9bcb68b288968c7b1'
  checksumType64 = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs;

$exeFile = Get-Item "$toolsDir/*.exe";
Move-Item $exeFile (Join-Path $toolsDir 'rustdesk.exe') -Force;
