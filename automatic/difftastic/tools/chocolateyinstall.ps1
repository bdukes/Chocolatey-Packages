$ErrorActionPreference = 'Stop';
$toolsDir = Split-Path -Parent $MyInvocation.MyCommand.Definition;

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = 'https://github.com/Wilfred/difftastic/releases/download/0.46.0/difft-x86_64-pc-windows-msvc.zip'
  checksum      = 'd51052eb6f02a2d934959d89bc64cc4fd20389eb31d68a5e255a67945e6ee524'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs;
