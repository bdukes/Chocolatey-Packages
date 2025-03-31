
$ErrorActionPreference = 'Stop';

$packageName = 'linqpad8.install'
$url = 'https://www.linqpad.net/GetFile.aspx?LINQPad8Setup.exe'

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'exe'
  url            = $url
  softwareName   = 'linqpad*'
  checksum       = 'bd6c52dba202181da9909183c08be508fa4e2f795f7cec104a9f5469d33f03f3'
  checksumType   = 'sha256'
  silentArgs     = "/verysilent"
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
Install-ChocolateyPath "${env:ProgramFiles}\LinqPad8"
