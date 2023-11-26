$ErrorActionPreference = 'Stop';
$toolsDir = Split-Path -Parent $MyInvocation.MyCommand.Definition;

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = 'https://github.com/Wilfred/difftastic/releases/download/0.53.1/difft-x86_64-pc-windows-msvc.zip'
  checksum      = '1f2616a2d7f2f77be6b62c52d6de2746eabf463a14f418f22e295fd3d243ac94'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs;
