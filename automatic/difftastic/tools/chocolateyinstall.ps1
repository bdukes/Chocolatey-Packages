$ErrorActionPreference = 'Stop';
$toolsDir = Split-Path -Parent $MyInvocation.MyCommand.Definition;

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = 'https://github.com/Wilfred/difftastic/releases/download/0.41.0/difft-x86_64-pc-windows-msvc.zip'
  checksum      = '9a5c91b952b78409c89c2b76029b3e9cb0890c6dd8deba1d71841d20f86d4112'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs;
