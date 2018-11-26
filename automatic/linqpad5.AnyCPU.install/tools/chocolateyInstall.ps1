
$ErrorActionPreference = 'Stop';

$packageName= 'linqpad5.AnyCPU.install'
$url        = 'https://www.linqpad.net/GetFile.aspx?LINQPad5Setup-AnyCPU.exe'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = $url
  softwareName  = 'linqpad*'
  checksum      = 'bd4ae14860c0146643c315dba9cf7cac1066c84e38b8940728ed819e55cb6e39'
  checksumType  = 'sha256'
  silentArgs    = "/silent"
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
Install-ChocolateyPath "${env:ProgramFiles}\LinqPad5"
