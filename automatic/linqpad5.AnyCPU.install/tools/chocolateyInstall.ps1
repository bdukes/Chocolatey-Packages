
$ErrorActionPreference = 'Stop';

$packageName= 'linqpad5.AnyCPU.install'
$url        = 'https://www.linqpad.net/GetFile.aspx?LINQPad5Setup-AnyCPU.exe'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = $url
  softwareName  = 'linqpad*'
  checksum      = '081d4ed3131259762d3c32d58e04032cbe0b72718dff7d36289df57233b88719'
  checksumType  = 'sha256'
  silentArgs    = "/silent"
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
Install-ChocolateyPath "${env:ProgramFiles}\LinqPad5"
