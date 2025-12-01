
$ErrorActionPreference = 'Stop';

$packageName = 'linqpad8.install'
$url = 'https://www.linqpad.net/GetFile.aspx?LINQPad8Setup.exe'

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'exe'
  url            = $url
  softwareName   = 'linqpad*'
  checksum       = 'd65cfdc3a86ba15d8f375844f27edd40ad2e73b9e9f7b90e723b22099b09df08'
  checksumType   = 'sha256'
  silentArgs     = "/verysilent"
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
Install-ChocolateyPath "${env:ProgramFiles}\LinqPad8"
