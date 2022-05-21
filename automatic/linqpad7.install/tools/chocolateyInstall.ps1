
$ErrorActionPreference = 'Stop';

$packageName = 'linqpad7.install'
$url = 'https://www.linqpad.net/GetFile.aspx?LINQPad7Setup.exe'

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'exe'
  url            = $url
  softwareName   = 'linqpad*'
  checksum       = 'ddcd777ce392e3863507661494daa3707ac9e3a5c6ba98fdcf084856a6dde49f'
  checksumType   = 'sha256'
  silentArgs     = "/verysilent"
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
Install-ChocolateyPath "${env:ProgramFiles}\LinqPad7"
