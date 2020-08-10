$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'hg'
  installerType  = 'exe'
  url            = 'https://www.mercurial-scm.org/release/windows/Mercurial-5.5-x86-python2.exe'
  url64          = 'https://www.mercurial-scm.org/release/windows/Mercurial-5.5-x64-python2.exe'
  checksum       = 'c9a0bde21d97034a8fbeef180d4ba9ae899aac6bf8e6b448fa5ea5945cb10b9f'
  checksumType   = 'sha256'
  checksum64     = '879d557b56fee58c4a01cda5c2cbfaec22c9c7875926e0de12451912b3944d3e'
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
