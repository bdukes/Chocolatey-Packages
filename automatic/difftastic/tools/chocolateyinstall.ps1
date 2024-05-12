$ErrorActionPreference = 'Stop';
$toolsDir = Split-Path -Parent $MyInvocation.MyCommand.Definition;

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = 'https://github.com/Wilfred/difftastic/releases/download/0.58.0/difft-x86_64-pc-windows-msvc.zip'
  checksum      = '4251678a8fa12c6017b5dfc2ad51f6b59eae3041c57957ad0b3a1794d2d2a5f8'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs;
