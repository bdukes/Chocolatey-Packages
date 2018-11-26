
$ErrorActionPreference = 'Stop';


$packageName= 'linqpad5.AnyCPU.portable'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://www.linqpad.net/GetFile.aspx?preview+LINQPad5-AnyCPU.zip'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  url           = $url
  checksum      = 'a861f81f1c2e9272b6ee041bceb3f5b4c7f9a99f62386e0662c56118fe208223'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

& "$toolsDir\LINQPad.exe" -ngen
