$ErrorActionPreference = 'Stop';

$packageName = 'linqpad4.portable'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://www.linqpad.net/GetFile.aspx?LINQPad4.zip'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  url           = $url
  checksum      = 'D66818ED4B0E6CC72090927A2D798BCACA5F842517ABF31830F09F17AEA67BA1'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
