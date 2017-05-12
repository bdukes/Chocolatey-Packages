
$ErrorActionPreference = 'Stop';


$packageName= 'linqpad5.AnyCPU.portable'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://www.linqpad.net/GetFile.aspx?preview+LINQPad5-AnyCPU.zip'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  url           = $url
  checksum      = '93ab51fcdd7f193cf8c00f6a2b1d2cf55a827a1a183325bf519debba9695cd50'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
