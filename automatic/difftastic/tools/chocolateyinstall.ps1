$ErrorActionPreference = 'Stop';
$toolsDir = Split-Path -Parent $MyInvocation.MyCommand.Definition;

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = 'https://github.com/Wilfred/difftastic/releases/download/0.44.0/difft-x86_64-pc-windows-msvc.zip'
  checksum      = '9ceef80e0ab7308bfbcca31d32f3e0c81c81d91918ebdfe4f93bbd20f382d9e5'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs;
