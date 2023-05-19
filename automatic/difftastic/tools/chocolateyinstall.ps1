$ErrorActionPreference = 'Stop';
$toolsDir = Split-Path -Parent $MyInvocation.MyCommand.Definition;

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = 'https://github.com/Wilfred/difftastic/releases/download/0.47.0/difft-x86_64-pc-windows-msvc.zip'
  checksum      = '0a19718eeb8ed0e004d98f443d0ae9aabb4d9d5a89bd1e1e4af9080599d22b43'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs;
