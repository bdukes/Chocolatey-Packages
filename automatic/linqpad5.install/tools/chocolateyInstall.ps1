
$ErrorActionPreference = 'Stop';

$packageName= 'linqpad5.install'
$url        = 'https://www.linqpad.net/GetFile.aspx?LINQPad5Setup.exe'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = $url
  softwareName  = 'linqpad*'
  checksum      = 'db6933004bdb774a908c17db9bc3cf544ee676900e759e2f6ab67b365ddeef69'
  checksumType  = 'sha256'
  silentArgs    = "/silent"
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
Install-ChocolateyPath "${env:ProgramFiles(x86)}\LinqPad5"
