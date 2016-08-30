$ErrorActionPreference = 'Stop';


$packageName= 'spawner'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://downloads.sourceforge.net/project/spawner/spawner/spawner-0.2.4/spawner-0.2.4-win32-i386.zip'
$url64 = 'https://downloads.sourceforge.net/project/spawner/spawner/spawner-0.2.4/spawner-0.2.4-win64-x86_64.zip'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  url           = $url
  url64bit      = $url64
  checksum      = 'ab66b0c35d21ecf615a3270041b6151ee3b811be'
  checksumType  = 'sha1'
  checksum64    = '1d00b20ae69d0159a0f421ce99cce71189f50b03'
  checksumType64= 'sha1'
}

Install-ChocolateyZipPackage @packageArgs
