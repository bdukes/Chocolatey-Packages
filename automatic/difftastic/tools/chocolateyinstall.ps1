$ErrorActionPreference = 'Stop';
$toolsDir = Split-Path -Parent $MyInvocation.MyCommand.Definition;

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = 'https://github.com/Wilfred/difftastic/releases/download/0.69.0/difft-x86_64-pc-windows-msvc.zip'
  checksum      = 'a5adbf57eb1b923b62d1c3596c4f827df143f5b52cfba48bb9e83f41dea90c02'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs;
