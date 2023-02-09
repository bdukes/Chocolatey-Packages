$ErrorActionPreference = 'Stop';
$toolsDir = Split-Path -Parent $MyInvocation.MyCommand.Definition;

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = 'https://github.com/Wilfred/difftastic/releases/download/0.43.1/difft-x86_64-pc-windows-msvc.zip'
  checksum      = 'ffc9cf544cff273d56e68d8c2a7760c646e659bfb5096c99a1265a226f602dec'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs;
