
$ErrorActionPreference = 'Stop';

$packageName= 'linqpad6.install'
$url        = 'https://www.linqpad.net/GetFile.aspx?LINQPad6Setup.exe'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = $url
  softwareName  = 'linqpad*'
  checksum      = '5D603BD0C3FEF850FEC29BB1F2437EE00FE928770C3BC79D0D745DE74123AB0F'
  checksumType  = 'sha256'
  silentArgs    = "/silent"
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
Install-ChocolateyPath "${env:ProgramFiles(x86)}\LinqPad6"
