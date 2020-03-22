
$ErrorActionPreference = 'Stop';

$packageName= 'linqpad6.install'
$url        = 'https://www.linqpad.net/GetFile.aspx?LINQPad6Setup.exe'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = $url
  softwareName  = 'linqpad*'
  checksum      = '034d52a929afa2dd7c75b2f3bd9d3bdd76e2766d894e39e0b36f035bfd06500b'
  checksumType  = 'sha256'
  silentArgs    = "/silent"
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
Install-ChocolateyPath "${env:ProgramFiles(x86)}\LinqPad6"
