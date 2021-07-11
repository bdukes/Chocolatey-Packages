
$ErrorActionPreference = 'Stop';


$packageName= 'linqpad6.portable'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://www.linqpad.net/GetFile.aspx?LINQPad6.zip'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  url           = $url
  checksum      = '7dba2b133118316743ddad89364a80eb206f14be9e5e3fee689c7c12c3113cdc'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

#& "$toolsDir\LINQPad6.exe" -ngen
