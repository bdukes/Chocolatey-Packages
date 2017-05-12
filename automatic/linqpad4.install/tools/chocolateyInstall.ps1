
$ErrorActionPreference = 'Stop';

$packageName= 'linqpad4.install'
$url        = 'https://www.linqpad.net/GetFile.aspx?LINQPad4Setup.exe'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = $url
  softwareName  = 'linqpad*'
  checksum      = ''
  checksumType  = 'sha256'
  silentArgs    = "/silent"
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
