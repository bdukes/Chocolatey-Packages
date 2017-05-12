
$ErrorActionPreference = 'Stop';


$packageName= 'linqpad4.AnyCPU.portable'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://www.linqpad.net/GetFile.aspx?LINQPad4-AnyCPU.zip'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  url           = $url
  checksum      = 'acd8667a5463dded52e7d82a9c7e528abc023ecf6b46cdcfb8a428ed5936eb19'
}

Install-ChocolateyZipPackage @packageArgs
