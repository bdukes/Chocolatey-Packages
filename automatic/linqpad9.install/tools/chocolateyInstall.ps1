
$ErrorActionPreference = 'Stop';

$packageName = 'linqpad9.install'
$url = 'https://www.linqpad.net/GetFile.aspx?LINQPad9Setup.exe'

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'exe'
  url            = $url
  softwareName   = 'linqpad*'
  checksum       = '851b9f6a6f45d50e70e9a24ad6b28ae027d91d2aa1de92aceb7ed4d6eb76ccb1'
  checksumType   = 'sha256'
  silentArgs     = "/verysilent"
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
Install-ChocolateyPath "${env:ProgramFiles}\LinqPad9"
