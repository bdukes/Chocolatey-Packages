$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = 'elm-platform'
  fileType      = 'EXE'
  url           = 'https://github.com/elm/compiler/releases/download/0.19.3/installer-for-windows.exe'
  silentArgs    = '/S'
  validExitCodes= @(0)
  softwareName  = 'Elm Platform*'
  checksum      = '964dbef5f34a500bfaead2ea1238d7c3c94d7e69416012ce02a012995240c982'
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs
