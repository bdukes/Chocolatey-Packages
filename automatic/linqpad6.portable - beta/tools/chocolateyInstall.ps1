
$ErrorActionPreference = 'Stop';


$packageName= 'linqpad6.portable'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://www.linqpad.net/GetFile.aspx?preview+LINQPad6-Beta.zip'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  url           = $url
  checksum      = 'd698222051ee95dcd18fb239b49d60918ce63c5e1c291d5855ee3d9f912297f2'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

& "$toolsDir\LINQPad.exe" -ngen
