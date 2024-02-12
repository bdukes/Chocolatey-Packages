
$ErrorActionPreference = 'Stop';

$packageName = 'linqpad8.install'
$url = 'https://www.linqpad.net/GetFile.aspx?LINQPad8Setup.exe'

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'exe'
  url            = $url
  softwareName   = 'linqpad*'
  checksum       = 'd068f2b789d507814b82ef40dab1098f056e8c5160cd8e3afad39a5b7b250761'
  checksumType   = 'sha256'
  silentArgs     = "/verysilent"
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
Install-ChocolateyPath "${env:ProgramFiles}\LinqPad8"
