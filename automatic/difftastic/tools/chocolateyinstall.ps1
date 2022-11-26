$ErrorActionPreference = 'Stop';
$toolsDir = Split-Path -Parent $MyInvocation.MyCommand.Definition;

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = 'https://github.com/Wilfred/difftastic/releases/download/0.38.0/difft-x86_64-pc-windows-msvc.zip'
  checksum      = '689e9b1303837913d6b208cd8283c780ee5954490cd006496dee9f3c4bbced04'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs;
