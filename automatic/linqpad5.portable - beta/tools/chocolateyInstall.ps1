
$ErrorActionPreference = 'Stop';


$packageName= 'linqpad5.portable'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://www.linqpad.net/GetFile.aspx?preview+LINQPad5.zip'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  url           = $url
  checksum      = 'aa73011212b19f04951ecdf6b96cadf531db046828ccaf99594add1fce3c0449'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
