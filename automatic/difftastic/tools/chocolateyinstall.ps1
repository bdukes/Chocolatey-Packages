$ErrorActionPreference = 'Stop';
$toolsDir = Split-Path -Parent $MyInvocation.MyCommand.Definition;

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = 'https://github.com/Wilfred/difftastic/releases/download/0.48.0/difft-x86_64-pc-windows-msvc.zip'
  checksum      = 'a66c480892465c0bf6b5417ba75ff1863ce65044cddfdef71f508f584cfc0191'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs;
