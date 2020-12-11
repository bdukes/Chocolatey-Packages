$ErrorActionPreference = 'Stop';

$packageName = 'linqpad4.AnyCPU.portable'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://www.linqpad.net/GetFile.aspx?LINQPad4-AnyCPU.zip'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  url           = $url
  checksum      = 'F3B0EA908DFC1096E28F4CE3CDB6ACEF59F5EA0F935B777161AD1E021A3437CE'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
