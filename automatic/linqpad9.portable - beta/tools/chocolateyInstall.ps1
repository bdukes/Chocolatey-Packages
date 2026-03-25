
$ErrorActionPreference = 'Stop';


$packageName = 'linqpad9.portable'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://www.linqpad.net/GetFile.aspx?preview+LINQPad9-Beta.zip'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  url           = $url
  checksum      = '7f75fa1dc0f37c388e0b1e623755139b8e4b8fa1d60d9622679956802e45b6bc'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

& "$toolsDir\LINQPad.exe" -ngen
