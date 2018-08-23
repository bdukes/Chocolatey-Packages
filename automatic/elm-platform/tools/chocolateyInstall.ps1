$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = 'elm-platform'
  fileType      = 'EXE'
  url           = 'https://github.com/elm/compiler/releases/download/0.19.0/installer-for-windows.exe'
  silentArgs    = '/S'
  validExitCodes= @(0)
  softwareName  = 'Elm Platform*'
  checksum      = 'b7139002a7f348c0428da6f47db551642f9c5d8a178a08e5b5a426a9a1d8a7d9'
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs
