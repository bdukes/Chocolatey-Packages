
$ErrorActionPreference = 'Stop';


$packageName= 'linqpad6.portable'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://www.linqpad.net/GetFile.aspx?preview+LINQPad6-Beta.zip'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  url           = $url
  checksum      = 'eed70c8f84d40fdd3d2680e59ff0692d82b20940c5fd9abd8fbb3aa8efe35c72'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

& "$toolsDir\LINQPad.exe" -ngen
