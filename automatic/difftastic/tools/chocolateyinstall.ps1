$ErrorActionPreference = 'Stop';
$toolsDir = Split-Path -Parent $MyInvocation.MyCommand.Definition;

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = 'https://github.com/Wilfred/difftastic/releases/download/0.60.0/difft-x86_64-pc-windows-msvc.zip'
  checksum      = 'a31068e3d1719dce1a1abc16191bc2df4a515926cd27c93b8a13393e7cb3acb4'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs;
