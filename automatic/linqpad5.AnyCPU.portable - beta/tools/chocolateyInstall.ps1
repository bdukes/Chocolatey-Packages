
$ErrorActionPreference = 'Stop';


$packageName= 'linqpad5.AnyCPU.portable'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://www.linqpad.net/GetFile.aspx?preview+LINQPad5-AnyCPU.zip'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  url           = $url
  checksum      = '5e50efac1faad504bbf833d02cf33fa3a1354d9f7fc424e5ffb0f6bc96ba1fac'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
