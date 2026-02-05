
$ErrorActionPreference = 'Stop';

$packageName = 'linqpad9.install'
$url = 'https://www.linqpad.net/GetFile.aspx?LINQPad9Setup.exe'

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'exe'
  url            = $url
  softwareName   = 'linqpad*'
  checksum       = '18acd6e50c5a32c3a37e59693472661b79b4c69a45e444fbaa4c065f67d46112'
  checksumType   = 'sha256'
  silentArgs     = "/verysilent"
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
Install-ChocolateyPath "${env:ProgramFiles}\LinqPad9"
