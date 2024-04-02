$ErrorActionPreference = 'Stop';
$toolsDir = Split-Path -Parent $MyInvocation.MyCommand.Definition;

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = 'https://github.com/Wilfred/difftastic/releases/download/0.57.0/difft-x86_64-pc-windows-msvc.zip'
  checksum      = '577059849aee32fe384388ce74c404c6e90036a6a4dd452160dcfe583c7f5497'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs;
