
$ErrorActionPreference = 'Stop';

$packageName= 'linqpad5.install'
$url        = 'https://www.linqpad.net/GetFile.aspx?LINQPad5Setup.exe'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = $url
  softwareName  = 'linqpad*'
  checksum      = 'acde8d491da20fd40e9773b030d62fa9feb6d12ce1ff33cf92db6ce51b01ac19'
  checksumType  = 'sha256'
  silentArgs    = "/silent"
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
Install-ChocolateyPath "${env:ProgramFiles(x86)}\LinqPad5"
