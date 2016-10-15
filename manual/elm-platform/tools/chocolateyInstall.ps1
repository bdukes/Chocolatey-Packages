$ErrorActionPreference = 'Stop';


$packageName= 'elm-platform'
$url        = 'http://install.elm-lang.org/Elm-Platform-0.17.1.exe'

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'EXE'
  url           = $url
  silentArgs    = '/S'
  validExitCodes= @(0)
  softwareName  = 'Elm Platform*'
  checksum      = '4cc68df57bf8e5c57c47fa88d14b21b56f282dc9'
  checksumType  = 'sha1'
}

Install-ChocolateyPackage @packageArgs
