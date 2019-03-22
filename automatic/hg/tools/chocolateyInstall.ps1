$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'hg'
  installerType  = 'exe'
  url            = 'https://www.mercurial-scm.org/release/windows/Mercurial-4.9.1.exe'
  url64          = 'https://www.mercurial-scm.org/release/windows/Mercurial-4.9.1-x64.exe'
  checksum       = 'd9f8e7adc1d8dad3e46328cb33243d8f14fcb5763c236d04aeb7b4a7efb72965'
  checksumType   = 'sha256'
  checksum64     = '9923559046660ff8fd3e880a5cfc7d79c67db52eb1235ab404beaa37f0485c55'
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
