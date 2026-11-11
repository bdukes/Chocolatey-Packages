
$ErrorActionPreference = 'Stop';

$packageName = 'linqpad9.install'
$url = 'https://www.linqpad.net/GetFile.aspx?LINQPad9Setup.exe'

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'exe'
  url            = $url
  softwareName   = 'linqpad*'
  checksum       = '99f24acf6efeab93b2f834ed57b3d6108e3d9b3f5c412a93a896b90f6cf5a893'
  checksumType   = 'sha256'
  silentArgs     = "/verysilent"
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
Install-ChocolateyPath "${env:ProgramFiles}\LinqPad9"
