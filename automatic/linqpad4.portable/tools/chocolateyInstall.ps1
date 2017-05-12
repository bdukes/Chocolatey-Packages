
$ErrorActionPreference = 'Stop';


$packageName= 'linqpad4.portable'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://www.linqpad.net/GetFile.aspx?LINQPad4.zip'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  url           = $url
  checksum      = ''
}

Install-ChocolateyZipPackage @packageArgs
