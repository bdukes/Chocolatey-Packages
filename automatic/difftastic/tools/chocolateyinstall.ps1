$ErrorActionPreference = 'Stop';
$toolsDir = Split-Path -Parent $MyInvocation.MyCommand.Definition;

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = 'https://github.com/Wilfred/difftastic/releases/download/0.49.0/difft-x86_64-pc-windows-msvc.zip'
  checksum      = '8740f2bb7d2e2b5564ec4e74982dc1b3f69fe9598ddfca61d1aa015a08078650'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs;
