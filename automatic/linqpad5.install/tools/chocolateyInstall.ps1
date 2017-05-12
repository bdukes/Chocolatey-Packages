
$ErrorActionPreference = 'Stop';

$packageName= 'linqpad5.install'
$url        = 'https://www.linqpad.net/GetFile.aspx?LINQPad5Setup.exe'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = $url
  softwareName  = 'linqpad*'
  checksum      = '32e7b50a1e2a0902ada2550ba7a8c1183d0751b4fb25de9b73c27c4f2363ab09'
  checksumType  = 'sha256'
  silentArgs    = "/silent"
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
