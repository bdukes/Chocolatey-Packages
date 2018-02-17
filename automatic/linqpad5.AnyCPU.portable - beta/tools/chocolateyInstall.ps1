
$ErrorActionPreference = 'Stop';


$packageName= 'linqpad5.AnyCPU.portable'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://www.linqpad.net/GetFile.aspx?preview+LINQPad5-AnyCPU.zip'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  url           = $url
  checksum      = 'c40a0b7c201ac323b6159eb2ce5bc0cf4ece1e157b9374583da1166f2d341855'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
