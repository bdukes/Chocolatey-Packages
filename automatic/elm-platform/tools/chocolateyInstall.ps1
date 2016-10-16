$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = 'elm-platform'
  fileType      = 'EXE'
  url           = 'http://install.elm-lang.org/Elm-Platform-0.17.1.exe'
  silentArgs    = '/S'
  validExitCodes= @(0)
  softwareName  = 'Elm Platform*'
  checksum      = 'B5BB5CD2107D4EA58D6A745A92309A6B2D3290A39CB0CACEB872C13D6CBCD6C1'
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs
