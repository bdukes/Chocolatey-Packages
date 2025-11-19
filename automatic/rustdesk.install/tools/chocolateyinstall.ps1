$ErrorActionPreference = 'Stop'

$url64                 = 'https://github.com/rustdesk/rustdesk/releases/download/1.4.4/rustdesk-1.4.4-x86_64.msi'
$checksum64            = 'b1dd7bb56bdb82150ff2d4713ce11de3d017ddbc20f7825595d14f954135ad82'
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
