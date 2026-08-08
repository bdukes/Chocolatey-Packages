$ErrorActionPreference = 'Stop';
$toolsDir = Split-Path -Parent $MyInvocation.MyCommand.Definition;

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = 'https://github.com/Wilfred/difftastic/releases/download/0.70.0/difft-x86_64-pc-windows-msvc.zip'
  checksum      = 'b563ae76e22ce28c7080a8b628cfabf6fa86f9ee114a0f5697bc2ca26f9ce1d7'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs;
