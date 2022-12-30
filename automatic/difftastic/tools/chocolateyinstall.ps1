$ErrorActionPreference = 'Stop';
$toolsDir = Split-Path -Parent $MyInvocation.MyCommand.Definition;

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = 'https://github.com/Wilfred/difftastic/releases/download/0.40.0/difft-x86_64-pc-windows-msvc.zip'
  checksum      = 'c1e4ad14017c70cbbab95ab810dfcae8420f668e8f4f56793f57565e8d490138'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs;
