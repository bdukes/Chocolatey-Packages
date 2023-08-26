$ErrorActionPreference = 'Stop';
$toolsDir = Split-Path -Parent $MyInvocation.MyCommand.Definition;

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = 'https://github.com/Wilfred/difftastic/releases/download/0.51.1/difft-x86_64-pc-windows-msvc.zip'
  checksum      = '024c2feabe97c7bef68ee71026f634811d1f6a24dc6718b8b817ee6556c0f0eb'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs;
