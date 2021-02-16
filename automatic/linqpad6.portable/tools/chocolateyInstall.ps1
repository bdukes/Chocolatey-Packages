
$ErrorActionPreference = 'Stop';


$packageName= 'linqpad6.portable'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://www.linqpad.net/GetFile.aspx?LINQPad6.zip'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  url           = $url
  checksum      = 'd99646663c6492a2ff4b61f98e282b206ebf919da72e10f42b5efadf9c3fa388'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

#& "$toolsDir\LINQPad6.exe" -ngen
