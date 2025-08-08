$ErrorActionPreference = 'Stop'

$url64                 = 'https://github.com/rustdesk/rustdesk/releases/download/1.4.1/rustdesk-1.4.1-x86_64.msi'
$checksum64            = '3a39884c60786cb96db66cbc3d837cacc7a6ed4bd39c3f59e884841da2849d18'
$ChecksumType64        = 'sha256'

$packageArgs = @{
  packageName           = $env:ChocolateyPackageName
  fileType              = 'msi'
  url64                 = $url64
  checksum64            = $checksum64
  checksumType64        = $checksumType64
  silentArgs            = "/qn /norestart"
  validExitCodes        = @(0, 3010)
  softwareName          = 'RustDesk*'
}

# Uninstall previous version prior to upgrade.
[array]$key = Get-UninstallRegistryKey -SoftwareName $packageArgs['softwareName'] | Select-Object -First 1

if ($key.QuietUninstallString) {
  $parts = $key.QuietUninstallString -split '\s+', 2

  $packageArgs = @{
    packageName = $env:ChocolateyPackageName
    file        = $parts[0]
    silentArgs  = $parts[1]
  }

  Uninstall-ChocolateyPackage @packageArgs
}

# Install the new version
Install-ChocolateyPackage @packageArgs
