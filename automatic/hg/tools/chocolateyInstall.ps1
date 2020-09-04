$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'hg'
  installerType  = 'exe'
  url            = 'https://www.mercurial-scm.org/release/windows/Mercurial-5.5.1-x86-python2.exe'
  url64          = 'https://www.mercurial-scm.org/release/windows/Mercurial-5.5.1-x64-python2.exe'
  checksum       = '6b8be7d5bc18494b8bb5381a1c03a074675b2b325280fb9cffabc2e071410677'
  checksumType   = 'sha256'
  checksum64     = '2f00543a6dc23f7769babe1d06621dc60e3dcc57febf61d15cc7468363b0eeca'
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
