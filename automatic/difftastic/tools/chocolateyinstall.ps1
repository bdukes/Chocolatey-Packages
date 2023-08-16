$ErrorActionPreference = 'Stop';
$toolsDir = Split-Path -Parent $MyInvocation.MyCommand.Definition;

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = 'https://github.com/Wilfred/difftastic/releases/download/0.50.0/difft-x86_64-pc-windows-msvc.zip'
  checksum      = '71062f28db45d9f7433f6ed131862d19a1045dd10bfa2c70790e70ab171a923d'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs;
