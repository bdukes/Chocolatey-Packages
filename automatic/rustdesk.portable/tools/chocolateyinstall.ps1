$ErrorActionPreference = 'Stop';
$toolsDir = Split-Path -Parent $MyInvocation.MyCommand.Definition;

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  url            = 'https://github.com/rustdesk/rustdesk/releases/download/1.1.9/rustdesk-1.1.9-windows_x32-portable.zip'
  url64bit       = 'https://github.com/rustdesk/rustdesk/releases/download/1.1.9/rustdesk-1.1.9-windows_x64-portable.zip'
  checksum       = '91ea1f1a1ee9eef31b34cfb0e694b2a8300a5b5ebfe26f857d4428447035223e'
  checksumType   = 'sha256'
  checksum64     = 'd3ec9dfc24d21c2ca73da8debb165acd1e690aeb21911249d544667f26b0df0f'
  checksumType64 = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs;

$exeFile = Get-Item "$toolsDir/*.exe";
New-Item -Path ($exeFile.FullName + '.ignore') -ItemType File;
Move-Item $exeFile (Join-Path $toolsDir 'rustdesk.exe') -Force;
