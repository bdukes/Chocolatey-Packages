
$ErrorActionPreference = 'Stop';


$packageName= 'spacesniffer'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'http://www.uderzo.it/main_products/space_sniffer/files/spacesniffer_1_3_0_1.zip'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  url           = $url
  checksum      = 'ea861ae1e7273b411d9da7630b80738bd5f0fab3'
  checksumType  = 'sha1'
}

Install-ChocolateyZipPackage @packageArgs
