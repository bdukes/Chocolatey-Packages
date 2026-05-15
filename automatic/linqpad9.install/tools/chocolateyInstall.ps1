
$ErrorActionPreference = 'Stop';

$packageName = 'linqpad9.install'
$url = 'https://www.linqpad.net/GetFile.aspx?LINQPad9Setup.exe'

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'exe'
  url            = $url
  softwareName   = 'linqpad*'
  checksum       = '647eb2a5ef74a4f517b6ebb6e6763a2e0381e27dc28e822b07700ff0763efce8'
  checksumType   = 'sha256'
  silentArgs     = "/verysilent"
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
Install-ChocolateyPath "${env:ProgramFiles}\LinqPad9"
