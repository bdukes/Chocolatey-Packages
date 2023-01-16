$ErrorActionPreference = 'Stop';
$toolsDir = Split-Path -Parent $MyInvocation.MyCommand.Definition;

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = 'https://github.com/Wilfred/difftastic/releases/download/0.42.0/difft-x86_64-pc-windows-msvc.zip'
  checksum      = 'aa45d045883644a2e817394a42041f5be4aebc1a58f87dbdf2f65d690f71f2d9'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs;
