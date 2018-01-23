
$ErrorActionPreference = 'Stop';


$packageName= 'linqpad5.AnyCPU.portable'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://www.linqpad.net/GetFile.aspx?preview+LINQPad5-AnyCPU.zip'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  url           = $url
  checksum      = '42150be21deb1898a90ed576cb98d542c8f9439ba2918a14b4c0cfc054f7b95b'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
