$ErrorActionPreference = 'Stop';
$toolsDir = Split-Path -Parent $MyInvocation.MyCommand.Definition;

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = 'https://github.com/Wilfred/difftastic/releases/download/0.67.0/difft-x86_64-pc-windows-msvc.zip'
  checksum      = '5fd7aa37ce90f838fb91f6e4b2765ac9cad0a7e9d1dccc5b19529fd6b4cbf8b4'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs;
