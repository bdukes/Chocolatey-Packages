$ErrorActionPreference = 'Stop';
$toolsDir = Split-Path -Parent $MyInvocation.MyCommand.Definition;

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = 'https://github.com/Wilfred/difftastic/releases/download/0.61.0/difft-x86_64-pc-windows-msvc.zip'
  checksum      = 'f2c8151b8bb03b17fe7314834e7a24e35f8fc2c2b1b18bd9c022ef68b21439d9'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs;
