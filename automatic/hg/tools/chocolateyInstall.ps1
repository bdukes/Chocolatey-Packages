$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'hg'
  installerType  = 'exe'
  url            = 'https://www.mercurial-scm.org/release/windows/Mercurial-4.3.3.exe'
  url64          = 'https://www.mercurial-scm.org/release/windows/Mercurial-4.3.3-x64.exe'
  checksum       = 'f41a2e1aea3d00b6cd9267e0c6adcd2d4fbc0f2b5fe3f9b2f210a821fd7de59f'
  checksumType   = 'sha256'
  checksum64     = 'f3704863803425627c57bd2ed522629e4cd8d907628dc6db7a3a7962fafd0f85'
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
