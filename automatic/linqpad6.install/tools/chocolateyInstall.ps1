
$ErrorActionPreference = 'Stop';

$packageName= 'linqpad6.install'
$url        = 'https://www.linqpad.net/GetFile.aspx?LINQPad6Setup.exe'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = $url
  softwareName  = 'linqpad*'
  checksum      = '4ab4fc740a8b48640cd9821f0c9e2dfb9ff2137263ebacd59455a3046632d832'
  checksumType  = 'sha256'
  silentArgs    = "/silent"
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
Install-ChocolateyPath "${env:ProgramFiles(x86)}\LinqPad6"
