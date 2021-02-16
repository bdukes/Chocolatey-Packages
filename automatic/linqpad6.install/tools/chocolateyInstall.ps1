
$ErrorActionPreference = 'Stop';

$packageName= 'linqpad6.install'
$url        = 'https://www.linqpad.net/GetFile.aspx?LINQPad6Setup.exe'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = $url
  softwareName  = 'linqpad*'
  checksum      = '36905cfca8a1be200b8edbd6607ba865d2dfc13c6c20a3451b40a5c51aebdf69'
  checksumType  = 'sha256'
  silentArgs    = "/silent"
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
Install-ChocolateyPath "${env:ProgramFiles(x86)}\LinqPad6"
