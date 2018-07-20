
$ErrorActionPreference = 'Stop';

$packageName= 'linqpad5.AnyCPU.install'
$url        = 'https://www.linqpad.net/GetFile.aspx?LINQPad5Setup-AnyCPU.exe'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = $url
  softwareName  = 'linqpad*'
  checksum      = 'D43E5440ADE785D344AC9583FC8B5B633B55B38E83B0CB8D3B30054BF092FAB7'
  checksumType  = 'sha256'
  silentArgs    = "/silent"
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
Install-ChocolateyPath "${env:ProgramFiles}\LinqPad5"
