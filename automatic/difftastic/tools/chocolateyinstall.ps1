$ErrorActionPreference = 'Stop';
$toolsDir = Split-Path -Parent $MyInvocation.MyCommand.Definition;

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = 'https://github.com/Wilfred/difftastic/releases/download/0.63.0/difft-x86_64-pc-windows-msvc.zip'
  checksum      = '033ae31243152cd47f88ad892b56a840a218414d5f279de32374ff3a81f15119'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs;
