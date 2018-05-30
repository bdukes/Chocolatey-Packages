
$ErrorActionPreference = 'Stop';


$packageName= 'linqpad5.AnyCPU.portable'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://www.linqpad.net/GetFile.aspx?LINQPad5-AnyCPU.zip'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  url           = $url
  checksum      = 'd2b1ac7f58f4e40216316d66cefa2a61df0914bb1e84350cd5c2f8f4a01c3911'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

& "$toolsDir\LINQPad.exe" -ngen
