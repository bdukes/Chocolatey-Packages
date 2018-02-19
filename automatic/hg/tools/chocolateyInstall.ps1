$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'hg'
  installerType  = 'exe'
  url            = 'https://www.mercurial-scm.org/release/windows/Mercurial-4.5.exe'
  url64          = 'https://www.mercurial-scm.org/release/windows/Mercurial-4.5-x64.exe'
  checksum       = 'e66db15844aca97a140f49b2b7c35a105674f4dccd1f7a13ca4b6be780d666d0'
  checksumType   = 'sha256'
  checksum64     = 'e96f0312e462ca96ef69d4be0c0f4b458ce853c49672cfe32be7c5ce99e5fc6b'
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
