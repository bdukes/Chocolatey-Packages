$ErrorActionPreference = 'Stop';
$toolsDir = Split-Path -Parent $MyInvocation.MyCommand.Definition;

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = 'https://github.com/Wilfred/difftastic/releases/download/0.68.0/difft-x86_64-pc-windows-msvc.zip'
  checksum      = 'a87429ebc75343c9731debfd083b954bbd1e87011f962078b9ade92e33440348'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs;
