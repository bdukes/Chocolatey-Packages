
$ErrorActionPreference = 'Stop';


$packageName= 'spacesniffer'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'http://www.uderzo.it/main_products/space_sniffer/files/spacesniffer_1_3_0_0.zip'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  url           = $url
  checksum      = '88c67c3e37e59bfa0bd4c22d3a991521316df195'
  checksumType  = 'sha1'
}

Install-ChocolateyZipPackage @packageArgs
