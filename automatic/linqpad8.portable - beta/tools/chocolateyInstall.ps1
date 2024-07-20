
$ErrorActionPreference = 'Stop';


$packageName = 'linqpad8.portable'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://www.linqpad.net/GetFile.aspx?preview+LINQPad8-Beta.zip'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  url           = $url
  checksum      = '9555bf259dca311b19bf0deb94301590d58e4aa4fe5c3d7e7842143da4041e0f'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

& "$toolsDir\LINQPad.exe" -ngen
