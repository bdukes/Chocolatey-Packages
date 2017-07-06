$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'hg'
  installerType  = 'exe'
  url            = 'https://www.mercurial-scm.org/release/windows/Mercurial-4.2.2.exe'
  url64          = 'https://www.mercurial-scm.org/release/windows/Mercurial-4.2.2-x64.exe'
  checksum       = '79b9cf8756893e574920816c5737d3d4b81148eb4d0bdbae764c813d621a00ab'
  checksumType   = 'sha256'
  checksum64     = '29781624f29a6483431b273287312986d6279bb1e5de44739261476b273a9484'
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
