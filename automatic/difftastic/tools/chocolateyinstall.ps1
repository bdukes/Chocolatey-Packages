$ErrorActionPreference = 'Stop';
$toolsDir = Split-Path -Parent $MyInvocation.MyCommand.Definition;

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = 'https://github.com/Wilfred/difftastic/releases/download/0.56.1/difft-x86_64-pc-windows-msvc.zip'
  checksum      = 'ee42892b303d414a922b7b3ab606ca1e140bc8532caf40685b9979121f268ff2'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs;
