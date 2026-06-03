$ErrorActionPreference = 'Stop'

$url64                 = 'https://github.com/rustdesk/rustdesk/releases/download/1.4.7/rustdesk-1.4.7-x86_64.msi'
$checksum64            = '106849afa83e852b8f972efa84007d6b1a9d2f02de14c3c4977cf090e2bacb88'
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

  $uninstallArgs = @{
    packageName = $env:ChocolateyPackageName
    file        = $parts[0]
    silentArgs  = $parts[1]
  }

  Uninstall-ChocolateyPackage @uninstallArgs
}

# Install the new version
Install-ChocolateyPackage @packageArgs
