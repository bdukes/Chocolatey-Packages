
$ErrorActionPreference = 'Stop';

$packageName= 'linqpad5.AnyCPU.install'
$url        = 'https://www.linqpad.net/GetFile.aspx?LINQPad5Setup-AnyCPU.exe'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = $url
  softwareName  = 'linqpad*'
  checksum      = 'ed6beb37c66eb92069e6bebf6a7ad5835779aa6e6e6cc4207d3ee58ecd4e4b34'
  checksumType  = 'sha256'
  silentArgs    = "/silent"
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
Install-ChocolateyPath "${env:ProgramFiles}\LinqPad5"
