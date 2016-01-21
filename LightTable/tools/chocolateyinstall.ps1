
$ErrorActionPreference = 'Stop';


$packageName= 'lighttable'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/LightTable/LightTable/releases/download/0.8.0-alpha/lighttable-0.8.0-alpha-windows.zip'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  url           = $url
}

Install-ChocolateyZipPackage @packageArgs
