$ErrorActionPreference = 'Stop';
$toolsDir = Split-Path -Parent $MyInvocation.MyCommand.Definition;

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = 'https://github.com/Wilfred/difftastic/releases/download/0.59.0/difft-x86_64-pc-windows-msvc.zip'
  checksum      = 'c0851b95cba930c3df44669592006c47d9cfe4a7e47b39988b0307d55e71c948'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs;
