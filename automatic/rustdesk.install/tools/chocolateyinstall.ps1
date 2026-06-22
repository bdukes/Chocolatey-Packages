$ErrorActionPreference = 'Stop'

$url64                 = 'https://github.com/rustdesk/rustdesk/releases/download/1.4.8/rustdesk-1.4.8-x86_64.msi'
$checksum64            = '17117c3a609445bb49cb9298c5cb53cf9c95f0bc4eae8353b81bb5b280c03307'
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
