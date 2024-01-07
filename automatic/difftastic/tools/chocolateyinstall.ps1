$ErrorActionPreference = 'Stop';
$toolsDir = Split-Path -Parent $MyInvocation.MyCommand.Definition;

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = 'https://github.com/Wilfred/difftastic/releases/download/0.54.0/difft-x86_64-pc-windows-msvc.zip'
  checksum      = '97cd9d94fa37ea31eb3a8439a8b2ff6a413d5f65f28d39e4d13593152ea90cad'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs;
