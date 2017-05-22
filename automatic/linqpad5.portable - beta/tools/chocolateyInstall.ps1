
$ErrorActionPreference = 'Stop';


$packageName= 'linqpad5.portable'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://www.linqpad.net/GetFile.aspx?preview+LINQPad5.zip'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  url           = $url
  checksum      = '8d74466820926d75fed4d2208b0b171a1f2d2b9c851d425e7561bf64de973707'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
