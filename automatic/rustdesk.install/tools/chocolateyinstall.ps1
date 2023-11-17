$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://github.com/rustdesk/rustdesk/releases/download/1.2.3/rustdesk-1.2.3-x86_64.exe'
  silentArgs     = "--silent-install"
  validExitCodes = @(0)
  checksum       = '23b661d7bc171cd500d5096456905283ffe06479582b62d3bd5066633935d43e'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs;
