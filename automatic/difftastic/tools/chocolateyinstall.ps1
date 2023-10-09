$ErrorActionPreference = 'Stop';
$toolsDir = Split-Path -Parent $MyInvocation.MyCommand.Definition;

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = 'https://github.com/Wilfred/difftastic/releases/download/0.52.0/difft-x86_64-pc-windows-msvc.zip'
  checksum      = '2c7780cd49cbc6dbaadf8680dc869f3d52c00cb7be25e6a426cb58f8407f44a9'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs;
