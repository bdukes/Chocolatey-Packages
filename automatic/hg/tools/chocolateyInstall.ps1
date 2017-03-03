$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'hg'
  installerType  = 'exe'
  url            = 'https://www.mercurial-scm.org/release/windows/Mercurial-4.1.1.exe'
  url64          = 'https://www.mercurial-scm.org/release/windows/Mercurial-4.1.1-x64.exe'
  checksum       = '305dbfeb10fe3f4355116fd532c49011325fdd0a84951959cc7b32d37fd5170f'
  checksumType   = 'sha256'
  checksum64     = 'e7352a372cc7e97808378ff18412eadfead568f052132739fd5c19981643e395'
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
