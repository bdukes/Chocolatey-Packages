$ErrorActionPreference = 'Stop';
$toolsDir = Split-Path -Parent $MyInvocation.MyCommand.Definition;

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = 'https://github.com/Wilfred/difftastic/releases/download/0.53.0/difft-x86_64-pc-windows-msvc.zip'
  checksum      = '7ea6a31b1937f3616607ebb9ecef636d71b2f0539419448f94bc7e290a6e96f6'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs;
