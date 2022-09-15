$ErrorActionPreference = 'Stop';
$toolsDir = Split-Path -Parent $MyInvocation.MyCommand.Definition;

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = 'https://github.com/Wilfred/difftastic/releases/download/0.35.0/difft-x86_64-pc-windows-msvc.zip'
  checksum      = '0e580ccb840893b5d4c39c805613304beeeb35e8b2f8bdfb2a37a8d7a1d7ee87'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs;
