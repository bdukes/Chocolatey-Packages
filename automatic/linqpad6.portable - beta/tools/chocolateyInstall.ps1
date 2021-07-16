
$ErrorActionPreference = 'Stop';


$packageName= 'linqpad6.portable'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://www.linqpad.net/GetFile.aspx?preview+LINQPad6-Beta.zip'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  url           = $url
  checksum      = 'd81be445b13ca2a0884166fa145d442013efada8cf42d0c7a78e9ee42dc7744e'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

& "$toolsDir\LINQPad.exe" -ngen
