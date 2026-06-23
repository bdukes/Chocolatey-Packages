
$ErrorActionPreference = 'Stop';

$packageName = 'linqpad9.install'
$url = 'https://www.linqpad.net/GetFile.aspx?LINQPad9Setup.exe'

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'exe'
  url            = $url
  softwareName   = 'linqpad*'
  checksum       = 'e0d280274727e4f820b51e30ac61f4d8a62ce67ebec12510acfdaa85a7359333'
  checksumType   = 'sha256'
  silentArgs     = "/verysilent"
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
Install-ChocolateyPath "${env:ProgramFiles}\LinqPad9"
