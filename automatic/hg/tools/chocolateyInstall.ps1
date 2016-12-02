$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'hg'
  installerType  = 'exe'
  url            = 'https://www.mercurial-scm.org/release/windows/Mercurial-4.0.1.exe'
  url64          = 'https://www.mercurial-scm.org/release/windows/Mercurial-4.0.1-x64.exe'
  checksum       = '043ff1597ee29a5209f0cc0b66d022dea9615a7699f7fc2572f79c63496a9fec'
  checksumType   = 'sha256'
  checksum64     = 'a6e200cae9000c90550db31bcd48005dfaf4e3ef9287f18924d56ce2f128ae8d'
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
