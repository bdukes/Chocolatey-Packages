$ErrorActionPreference = 'Stop';
$toolsDir = Split-Path -parent $MyInvocation.MyCommand.Definition;

$packageArgs = @{
  packageName   = 'imagemagick.tool'
  file          = Get-Item $toolsDir\*_x32.zip
  file64        = Get-Item $toolsDir\*_x64.zip
  unzipLocation = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
}

Install-ChocolateyZipPackage @packageArgs
