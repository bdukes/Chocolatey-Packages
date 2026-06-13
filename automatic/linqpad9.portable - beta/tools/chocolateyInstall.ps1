
$ErrorActionPreference = 'Stop';


$packageName = 'linqpad9.portable'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://www.linqpad.net/GetFile.aspx?preview+LINQPad9-Beta.zip'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  url           = $url
  checksum      = '2cffa81c329bcceef2fcdc12931ca8393e9a66eadfd764262410de429f7b69e7'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

& "$toolsDir\LINQPad.exe" -ngen
