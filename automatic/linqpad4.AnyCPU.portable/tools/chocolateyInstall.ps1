
$ErrorActionPreference = 'Stop';


$packageName= 'linqpad4.AnyCPU.portable'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://www.linqpad.net/GetFile.aspx?LINQPad4-AnyCPU.zip'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  url           = $url
  checksum      = ''
}

Install-ChocolateyZipPackage @packageArgs
