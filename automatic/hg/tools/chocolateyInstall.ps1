$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'hg'
  installerType  = 'exe'
  url            = 'https://www.mercurial-scm.org/release/windows/Mercurial-4.1.exe'
  url64          = 'https://www.mercurial-scm.org/release/windows/Mercurial-4.1-x64.exe'
  checksum       = '0043b73c73366851c21f6f592bd3c5d1d031db7752db8fcfb4d2c55b46b30776'
  checksumType   = 'sha256'
  checksum64     = '0242dc89da3535eb1ade134bc7ac6a8bdadc64f5d16af3925f6364a800dbbc3f'
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
