$ErrorActionPreference = 'Stop';
$toolsDir = Split-Path -Parent $MyInvocation.MyCommand.Definition;

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = 'https://github.com/Wilfred/difftastic/releases/download/0.62.0/difft-x86_64-pc-windows-msvc.zip'
  checksum      = '8c4df8d075018102038b94a57f9b7f7b21a365538d4ee4cfe7eb541ac7f8bd33'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs;
