$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = 'elm-platform'
  fileType      = 'EXE'
  url           = 'https://44a95588fe4cc47efd96-ec3c2a753a12d2be9f23ba16873acc23.ssl.cf2.rackcdn.com/Elm-Platform-0.18.exe'
  silentArgs    = '/S'
  validExitCodes= @(0)
  softwareName  = 'Elm Platform*'
  checksum      = 'e4b392e2cb8deb0bcf6c4d0b5f69f4df187416ea815d4ab09bafa5c036640967'
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs
