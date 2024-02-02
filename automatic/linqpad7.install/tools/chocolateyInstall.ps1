
$ErrorActionPreference = 'Stop';

$packageName = 'linqpad7.install'
$url = 'https://www.linqpad.net/GetFile.aspx?LINQPad7Setup.exe'

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'exe'
  url            = $url
  softwareName   = 'linqpad*'
  checksum       = '2eeb973b082f8c8005fa7feb86a5c10c2276fa6922ddc203d56540d9e4bb821d'
  checksumType   = 'sha256'
  silentArgs     = "/verysilent"
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
Install-ChocolateyPath "${env:ProgramFiles}\LinqPad7"
