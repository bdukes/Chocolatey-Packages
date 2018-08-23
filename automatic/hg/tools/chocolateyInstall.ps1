$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'hg'
  installerType  = 'exe'
  url            = 'https://www.mercurial-scm.org/release/windows/Mercurial-4.7.exe'
  url64          = 'https://www.mercurial-scm.org/release/windows/Mercurial-4.7-x64.exe'
  checksum       = '62b517e5a609be8614d8bad728e0d35783af82c18ade371c24ef6486c81cd8b1'
  checksumType   = 'sha256'
  checksum64     = 'fc9846057479936093f6bae68e476faa74604dcbc66560c33186a7f82aa11137'
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
