
$ErrorActionPreference = 'Stop';


$packageName= 'linqpad5.AnyCPU.portable'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://www.linqpad.net/GetFile.aspx?preview+LINQPad5-AnyCPU.zip'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  url           = $url
  checksum      = '5b05cad224fc22ab2c3715ef8350f68a095480f7ff063480f97281dfcbc0df49'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
