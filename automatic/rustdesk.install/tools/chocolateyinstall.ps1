$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://github.com/rustdesk/rustdesk/releases/download/1.2.3-1/rustdesk-1.2.3-1-x86_64.exe'
  silentArgs     = "--silent-install"
  validExitCodes = @(0)
  checksum       = '4996194639c099db0d854d20832a64e6629fefa37ce6a01ffd8710ac6c9e2522'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs;
