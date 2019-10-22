$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = 'elm-platform'
  fileType      = 'EXE'
  url           = 'https://github.com/elm/compiler/releases/download/0.19.1/installer-for-windows.exe'
  silentArgs    = '/S'
  validExitCodes= @(0)
  softwareName  = 'Elm Platform*'
  checksum      = '02947D00090F556ABCF8F8E95997AC993825BD783ABF05786AFE8F60A002D496'
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs
