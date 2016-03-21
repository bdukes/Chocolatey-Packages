$ErrorActionPreference = 'Stop';


$packageName= 'elm-platform'
$url        = 'http://install.elm-lang.org/Elm-Platform-0.16.exe'

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'EXE'
  url           = $url
  silentArgs   = '/S'
  validExitCodes= @(0)
  softwareName  = 'Elm Platform*'
  checksum      = 'dc10b901ab1305b37cd45b9b4d23362c43b6d060'
  checksumType  = 'sha1'
}

Install-ChocolateyPackage @packageArgs
