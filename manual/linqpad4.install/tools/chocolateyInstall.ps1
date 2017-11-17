
$ErrorActionPreference = 'Stop';

$packageName= 'linqpad4.install'
$url        = 'https://www.linqpad.net/GetFile.aspx?LINQPad4Setup.exe'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = $url
  softwareName  = 'linqpad*'
  checksum      = '244811fd6a1c3eba338b883e315cc6774bd1b0c3a44f4412b4fca06e03f56571'
  checksumType  = 'sha256'
  silentArgs    = "/silent"
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
