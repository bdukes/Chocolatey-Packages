
$ErrorActionPreference = 'Stop';


$packageName= 'linqpad5.portable'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://www.linqpad.net/GetFile.aspx?preview+LINQPad5.zip'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  url           = $url
  checksum      = '3a4e8d308b3953a2d5a692187f018b2ca5ffbfc3d96197d4e5fcd9079ba8cbf9'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
