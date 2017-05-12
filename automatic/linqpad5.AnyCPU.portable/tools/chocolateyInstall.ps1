
$ErrorActionPreference = 'Stop';


$packageName= 'linqpad5.AnyCPU.portable'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://www.linqpad.net/GetFile.aspx?LINQPad5-AnyCPU.zip'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  url           = $url
  checksum      = '10b264b798646789cc240d46a1f2d69d351cb3ebfd326cbcb26ab7377eda56e3'
}

Install-ChocolateyZipPackage @packageArgs
