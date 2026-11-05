
$ErrorActionPreference = 'Stop';


$packageName = 'linqpad9.portable'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://www.linqpad.net/GetFile.aspx?preview+LINQPad9-Beta.zip'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  url           = $url
  checksum      = '6ed7b843475be098fdf91e3d3d305b03838f1e6493b7acccf3e61ee2755c82d6'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

& "$toolsDir\LINQPad.exe" -ngen
