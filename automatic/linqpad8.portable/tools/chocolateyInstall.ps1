
$ErrorActionPreference = 'Stop';


$packageName = 'linqpad8.portable'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://www.linqpad.net/GetFile.aspx?LINQPad8.zip'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  url           = $url
  checksum      = '4449db9bac597509e133a9b2002d628a2516bf73626349151b2e876c656ff00b'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

#& "$toolsDir\LINQPad8.exe" -ngen
