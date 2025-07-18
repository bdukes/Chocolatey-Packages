$ErrorActionPreference = 'Stop';
$toolsDir = Split-Path -Parent $MyInvocation.MyCommand.Definition;

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = 'https://github.com/Wilfred/difftastic/releases/download/0.64.0/difft-x86_64-pc-windows-msvc.zip'
  checksum      = '1ac0113adf9ade9417ee133bed38efe3085b7ccbb32ab620bdc36c4a9b365276'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs;
