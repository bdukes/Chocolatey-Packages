
$ErrorActionPreference = 'Stop';

$packageName= 'linqpad5.install'
$url        = 'https://www.linqpad.net/GetFile.aspx?LINQPad5Setup.exe'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = $url
  softwareName  = 'linqpad*'
  checksum      = 'b90aedffb2e0d0f0b44882bb010264e3ef7741affcdbfc91f059ee22ec5bb46b'
  checksumType  = 'sha256'
  silentArgs    = "/silent"
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
Install-ChocolateyPath "${env:ProgramFiles(x86)}\LinqPad5"
