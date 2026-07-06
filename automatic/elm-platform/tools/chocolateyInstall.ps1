$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = 'elm-platform'
  fileType      = 'EXE'
  url           = 'https://github.com/elm/compiler/releases/download/0.19.2/installer-for-windows.exe'
  silentArgs    = '/S'
  validExitCodes= @(0)
  softwareName  = 'Elm Platform*'
  checksum      = '9de9ae1be7049391e1b353ecbe4d13f7527777b9c5e6ebb212b52b31b3fdc2be'
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs
