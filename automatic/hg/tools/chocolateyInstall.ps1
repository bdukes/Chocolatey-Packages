$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'hg'
  installerType  = 'exe'
  url            = 'https://www.mercurial-scm.org/release/windows/Mercurial-4.8.1.exe'
  url64          = 'https://www.mercurial-scm.org/release/windows/Mercurial-4.8.1-x64.exe'
  checksum       = '72c1fbcf73105501d78a9fe8eaf38e522bf1b4a889e286575c7be814bc50e21d'
  checksumType   = 'sha256'
  checksum64     = 'eadc171ce8b1a84ac8b2d872bb613f14b50f755dce7cd6cb241bd31554a4918e'
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
