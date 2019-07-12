$ErrorActionPreference = 'Stop';


$packageName= 'DefaultProgramsEditor'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://defaultprogramseditor.com/download'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  url           = $url
  checksum      = 'd84e0588289a661e796c761cc40ba3cb53a7824d955a8c260e2ac9f74b77b827'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
