
$ErrorActionPreference = 'Stop';

$packageName= 'linqpad5.AnyCPU.install'
$url        = 'https://www.linqpad.net/GetFile.aspx?LINQPad5Setup-AnyCPU.exe'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = $url
  softwareName  = 'linqpad*'
  checksum      = '86adc1052c89839e4704fe813b5ca79ed6f1c3b4e079a0cc8c569baf3cbf3049'
  checksumType  = 'sha256'
  silentArgs    = "/silent"
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
Install-ChocolateyPath "${env:ProgramFiles}\LinqPad5"
