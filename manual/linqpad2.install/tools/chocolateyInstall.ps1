Install-ChocolateyPackage 'linqpad2.install' 'exe' '/silent' 'https://www.linqpad.net/GetFile.aspx?LINQPadSetup.exe'

$ErrorActionPreference = 'Stop';

$packageName= 'linqpad2.install'
$url        = 'https://www.linqpad.net/GetFile.aspx?LINQPadSetup.exe'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = $url
  softwareName  = 'linqpad*'
  checksum      = ''
  checksumType  = 'sha256'
  silentArgs    = "/silent"
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
