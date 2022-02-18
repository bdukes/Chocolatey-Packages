
$ErrorActionPreference = 'Stop';

$packageName = 'linqpad7.install'
$url = 'https://www.linqpad.net/GetFile.aspx?LINQPad7Setup.exe'

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'exe'
  url            = $url
  softwareName   = 'linqpad*'
  checksum       = '03ba7e11ee00f930c7cb62061a35248ba25ba12450f88544e26ebf659ce86ac6'
  checksumType   = 'sha256'
  silentArgs     = "/verysilent"
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
Install-ChocolateyPath "${env:ProgramFiles(x86)}\LinqPad7"
