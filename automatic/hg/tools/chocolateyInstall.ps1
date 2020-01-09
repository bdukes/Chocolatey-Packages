$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'hg'
  installerType  = 'exe'
  url            = 'https://www.mercurial-scm.org/release/windows/Mercurial-5.2.2.exe'
  url64          = 'https://www.mercurial-scm.org/release/windows/Mercurial-5.2.2-x64.exe'
  checksum       = '115544dcbbef0ae93486705603d2da70cc0f3412bd7483c568ca32d6b050e690'
  checksumType   = 'sha256'
  checksum64     = 'ca75f9cec7b9ae9b05cf5394277f5e7de12cc4ecc1fde4575a908bdf1a7e073d'
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
