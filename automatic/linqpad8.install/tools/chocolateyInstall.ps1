
$ErrorActionPreference = 'Stop';

$packageName = 'linqpad8.install'
$url = 'https://www.linqpad.net/GetFile.aspx?LINQPad8Setup.exe'

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'exe'
  url            = $url
  softwareName   = 'linqpad*'
  checksum       = 'bc80999ca55b4b701160f8e03dc7a2240464955d228143cf71ec02c0309271f1'
  checksumType   = 'sha256'
  silentArgs     = "/verysilent"
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
Install-ChocolateyPath "${env:ProgramFiles}\LinqPad8"
