
$ErrorActionPreference = 'Stop';


$packageName= 'linqpad5.portable'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://www.linqpad.net/GetFile.aspx?LINQPad5.zip'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  url           = $url
  checksum      = '45cc795d8c0123a818af8f83e1ee031eeb5be086385f267d48ca04f3ec15cf76'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
