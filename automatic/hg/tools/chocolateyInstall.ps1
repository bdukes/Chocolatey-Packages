$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'hg'
  installerType  = 'exe'
  url            = 'https://www.mercurial-scm.org/release/windows/Mercurial-4.8.2.exe'
  url64          = 'https://www.mercurial-scm.org/release/windows/Mercurial-4.8.2-x64.exe'
  checksum       = 'df12f3ad5fd34782d1f5338c33ffc0519e4bdf0f5f79180840791080ed3c1ce0'
  checksumType   = 'sha256'
  checksum64     = 'a89f087c4fb8c70156c520080b9688974df1f128c43454e8e543ac69d8347b2f'
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
