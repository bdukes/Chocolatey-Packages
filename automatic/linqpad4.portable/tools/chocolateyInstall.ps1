
$ErrorActionPreference = 'Stop';


$packageName= 'linqpad4.portable'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://www.linqpad.net/GetFile.aspx?LINQPad4.zip'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  url           = $url
  checksum      = '0f714ae0cb11d6f9b8c577196187b4b290007012cf8c0457850e91f81982e3f2'
}

Install-ChocolateyZipPackage @packageArgs
