
$ErrorActionPreference = 'Stop';

$packageName = 'linqpad7.install'
$url = 'https://www.linqpad.net/GetFile.aspx?LINQPad7Setup.exe'

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'exe'
  url            = $url
  softwareName   = 'linqpad*'
  checksum       = '0591b11aed5a6dc67c48e3ee72ac88c587f210ff1b5f32dad94392f9414caa10'
  checksumType   = 'sha256'
  silentArgs     = "/verysilent"
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
Install-ChocolateyPath "${env:ProgramFiles}\LinqPad7"
