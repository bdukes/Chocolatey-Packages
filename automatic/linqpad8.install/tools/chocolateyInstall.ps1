
$ErrorActionPreference = 'Stop';

$packageName = 'linqpad8.install'
$url = 'https://www.linqpad.net/GetFile.aspx?LINQPad8Setup.exe'

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'exe'
  url            = $url
  softwareName   = 'linqpad*'
  checksum       = '61d979bf71d7467da3ade533758640353c184ebd0a7913416bc415813edf370a'
  checksumType   = 'sha256'
  silentArgs     = "/verysilent"
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
Install-ChocolateyPath "${env:ProgramFiles}\LinqPad8"
