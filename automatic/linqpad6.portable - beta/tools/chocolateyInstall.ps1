
$ErrorActionPreference = 'Stop';


$packageName= 'linqpad6.portable'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://www.linqpad.net/GetFile.aspx?preview+LINQPad6-Beta.zip'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  url           = $url
  checksum      = 'cfef2344840a9a7a80b7af08fd34b4b24e9496fd809e045a3160c6328454ee1b'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

& "$toolsDir\LINQPad.exe" -ngen
