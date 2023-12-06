
$ErrorActionPreference = 'Stop';

$packageName = 'linqpad7.install'
$url = 'https://www.linqpad.net/GetFile.aspx?LINQPad7Setup.exe'

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'exe'
  url            = $url
  softwareName   = 'linqpad*'
  checksum       = '402f8f1e33a566a3d3e9d96409744534d19ab166fc092d61f4750fee157a2a28'
  checksumType   = 'sha256'
  silentArgs     = "/verysilent"
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
Install-ChocolateyPath "${env:ProgramFiles}\LinqPad7"
