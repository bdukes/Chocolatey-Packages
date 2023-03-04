$ErrorActionPreference = 'Stop';
$toolsDir = Split-Path -Parent $MyInvocation.MyCommand.Definition;

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = 'https://github.com/Wilfred/difftastic/releases/download/0.45.0/difft-x86_64-pc-windows-msvc.zip'
  checksum      = '13944c3b30fcec52939f8b107bf0d2629d6964a471adef4c5feb424a244950d3'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs;
