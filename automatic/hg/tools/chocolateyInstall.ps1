$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'hg'
  installerType  = 'exe'
  url            = 'https://www.mercurial-scm.org/release/windows/Mercurial-5.3.2.exe'
  url64          = 'https://www.mercurial-scm.org/release/windows/Mercurial-5.3.2-x64.exe'
  checksum       = 'b57b42ef71776969b44fde4f036c5a0f21fe1a3a7d366507f7a761f506251b35'
  checksumType   = 'sha256'
  checksum64     = 'e4668f098da30ece283cff8a0f1046e687f8ebd966d88f34be91e48d2c9d76be'
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
