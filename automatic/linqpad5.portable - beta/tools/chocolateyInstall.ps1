
$ErrorActionPreference = 'Stop';


$packageName= 'linqpad5.portable'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://www.linqpad.net/GetFile.aspx?preview+LINQPad5.zip'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  url           = $url
  checksum      = 'f0f85c34ebfdc844c763a0c1a3f938281b7ce2ee4ad7f69ba22dbbe3a73234a3'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
