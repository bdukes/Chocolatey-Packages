
$ErrorActionPreference = 'Stop';


$packageName= 'linqpad5.portable'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://www.linqpad.net/GetFile.aspx?preview+LINQPad5.zip'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  url           = $url
  checksum      = '1369b70fe56580074497837ac97f6ae305e9d63674ef69472d3c478f1e51754a'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
