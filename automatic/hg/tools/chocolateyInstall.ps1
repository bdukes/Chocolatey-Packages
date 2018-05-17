$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'hg'
  installerType  = 'exe'
  url            = 'https://www.mercurial-scm.org/release/windows/Mercurial-4.6.exe'
  url64          = 'https://www.mercurial-scm.org/release/windows/Mercurial-4.6-x64.exe'
  checksum       = 'a2a6368b5c388203f2d426031b131c4ef9eced1fe70b46fd19ea311460d7f89c'
  checksumType   = 'sha256'
  checksum64     = 'eaf1a30689a1cf357e366ab80d02cb566c46d4fc2c31f7113b3af8053b3da843'
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
