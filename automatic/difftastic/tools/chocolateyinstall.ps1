$ErrorActionPreference = 'Stop';
$toolsDir = Split-Path -Parent $MyInvocation.MyCommand.Definition;

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = 'https://github.com/Wilfred/difftastic/releases/download/0.39.0/difft-x86_64-pc-windows-msvc.zip'
  checksum      = '915e3992947254826d895547c9c2468be0e9f7afd080a904eb0ab894905c315f'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs;
