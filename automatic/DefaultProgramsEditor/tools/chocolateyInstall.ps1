$ErrorActionPreference = 'Stop';


$packageName= 'DefaultProgramsEditor'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://defaultprogramseditor.com/download'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  url           = $url
  checksum      = 'de9071a5e9d34e97a3eacfc68fd7b18b1c91c77328b152e355cc468873c665dd'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
