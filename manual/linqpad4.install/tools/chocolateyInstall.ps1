$ErrorActionPreference = 'Stop';

$packageName = 'linqpad4.install'
$url = 'https://www.linqpad.net/GetFile.aspx?LINQPad4Setup.exe'

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'exe'
  url            = $url
  softwareName   = 'linqpad*'
  checksum       = '38C8DBE4DFD305D18EC26CDB838B3AA744C0827E2C6A38A02AC5097A2B079B50'
  checksumType   = 'sha256'
  silentArgs     = "/silent"
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
