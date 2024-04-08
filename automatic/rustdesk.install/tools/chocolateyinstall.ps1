$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://github.com/rustdesk/rustdesk/releases/download/1.2.3-2/rustdesk-1.2.3-2-x86_64.exe'
  silentArgs     = "--silent-install"
  validExitCodes = @(0)
  checksum       = '04f61d92f0723aadbd6410e329197b7a3d245b8a31ae5f71224946aa83ef3db8'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs;
