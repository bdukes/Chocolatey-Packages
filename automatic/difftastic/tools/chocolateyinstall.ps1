$ErrorActionPreference = 'Stop';
$toolsDir = Split-Path -Parent $MyInvocation.MyCommand.Definition;

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = 'https://github.com/Wilfred/difftastic/releases/download/0.65.0/difft-x86_64-pc-windows-msvc.zip'
  checksum      = '2c8382ecc453f905408728bf901aa98289306625fe1f4e37549e90936cbc9d11'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs;
