$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'hg'
  installerType  = 'exe'
  url            = 'https://www.mercurial-scm.org/release/windows/Mercurial-4.4.exe'
  url64          = 'https://www.mercurial-scm.org/release/windows/Mercurial-4.4-x64.exe'
  checksum       = '86d944e8b65b4f5f17c2013b2976452141ce05c902e5c11a50401af2cffbd4f1'
  checksumType   = 'sha256'
  checksum64     = '387d73da4c41a34fc1fe49afbe6af94effb421f4e16939aa02e186d62f5e514b'
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
