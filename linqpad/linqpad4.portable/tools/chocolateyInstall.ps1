
$ErrorActionPreference = 'Stop';


$packageName= 'linqpad4.portable'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'http://www.linqpad.net/GetFile.aspx?LINQPad4.zip'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  url           = $url
}

Install-ChocolateyZipPackage @packageArgs
