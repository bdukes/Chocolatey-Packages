$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'hg'
  installerType  = 'exe'
  url            = 'https://www.mercurial-scm.org/release/windows/Mercurial-5.1.2.exe'
  url64          = 'https://www.mercurial-scm.org/release/windows/Mercurial-5.1.2-x64.exe'
  checksum       = '47647203bf160126c54e44a30881d326e5902ee8e90e917a2e763f8de0f56fbd'
  checksumType   = 'sha256'
  checksum64     = 'e88ff4640f08e3ff9f4e366c547b5c9430e0670a99a8273ad4e522d122d47a14'
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
