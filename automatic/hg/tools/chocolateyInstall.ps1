$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'hg'
  installerType  = 'exe'
  url            = 'https://www.mercurial-scm.org/release/windows/Mercurial-4.3.exe'
  url64          = 'https://www.mercurial-scm.org/release/windows/Mercurial-4.3-x64.exe'
  checksum       = '1820da555625d8a619506f389e8dee150b67a462c17e15ec0c8cf93fa3298106'
  checksumType   = 'sha256'
  checksum64     = 'aee1536960f37b6a702e0ff735171209c38069e7c75d1d5bd6cfc2238f0134ad'
  checksumType64 = 'sha256'
  silentArgs     = '/VERYSILENT'
  validExitCodes = @(0, 3010)
}


Install-ChocolateyPackage @packageArgs

try {
    $regEntries = @(Get-ChildItem HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\ | ? { $_.GetValue('DisplayName') -like 'Mercurial*' })
    foreach ($regEntry in $regEntries) {
        $installLocation = $regEntry.GetValue('InstallLocation')
        if ($installLocation) {
            Install-ChocolateyPath $installLocation
        }
    }
} catch {
    throw $_
}
