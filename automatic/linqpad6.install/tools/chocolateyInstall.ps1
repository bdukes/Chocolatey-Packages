
$ErrorActionPreference = 'Stop';

$packageName= 'linqpad6.install'
$url        = 'https://www.linqpad.net/GetFile.aspx?LINQPad6Setup.exe'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = $url
  softwareName  = 'linqpad*'
  checksum      = '41170259f5b710260ffc462373d21d0dd1e86f5761eb87f2e21557ba2f4afa19'
  checksumType  = 'sha256'
  silentArgs    = "/silent"
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
Install-ChocolateyPath "${env:ProgramFiles(x86)}\LinqPad6"
