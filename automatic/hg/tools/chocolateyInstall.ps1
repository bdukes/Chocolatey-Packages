$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'hg'
  installerType  = 'exe'
  url            = 'https://www.mercurial-scm.org/release/windows/Mercurial-4.6.2.exe'
  url64          = 'https://www.mercurial-scm.org/release/windows/Mercurial-4.6.2-x64.exe'
  checksum       = 'b5534fb2e7156f236b08de027c1490b1580b185b123ed6e99196c64cb813e9ba'
  checksumType   = 'sha256'
  checksum64     = 'a43f499707ff248e3acbc117c9cb7e673172e5170fe7d0fd1d86f1f3f0e4bb5e'
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
