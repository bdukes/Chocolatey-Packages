$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = 'hg'
  installerType = 'exe'
  url           = 'https://www.mercurial-scm.org/release/windows/Mercurial-3.9.exe'
  url64bit      = 'https://www.mercurial-scm.org/release/windows/Mercurial-3.9-x64.exe'
  checksum      = 'FC91246C90D08698022FD577668B63C5D653DF1EA94F459C07809946EEA10C8B'
  checksumType  = 'sha256'
  checksum64    = 'B58CBCD3EFD9BC46D2B7B05BF5F7FA281F3CB51592DEB34F59AC46C178E7D05E'
  checksumType64= 'sha256'
  silentArgs    = '/VERYSILENT'
  validExitCodes= @(0, 3010)
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