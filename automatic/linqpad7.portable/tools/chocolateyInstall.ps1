
$ErrorActionPreference = 'Stop';


$packageName = 'linqpad7.portable'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://www.linqpad.net/GetFile.aspx?LINQPad7.zip'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  url           = $url
  checksum      = '7cd622a003e1b225c2746b2b4d020af4f285f2cf27b39de5b311f2b999e067a7'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

#& "$toolsDir\LINQPad7.exe" -ngen
