
$ErrorActionPreference = 'Stop';


$packageName = 'linqpad9.portable'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://www.linqpad.net/GetFile.aspx?preview+LINQPad9-Beta.zip'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  url           = $url
  checksum      = '387228d7f14af60c02244f683aa57528605e467077fc44cb0b50410a56798632'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

& "$toolsDir\LINQPad.exe" -ngen
