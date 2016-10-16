$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'hg'
  installerType  = 'exe'
  url            = 'https://www.mercurial-scm.org/release/windows/Mercurial-3.9.2.exe'
  url64          = 'https://www.mercurial-scm.org/release/windows/Mercurial-3.9.2-x64.exe'
  checksum       = '82a6cc0ccd066de34c25ca669ce988c18bb197da9827afe1c397556c2f61ac65'
  checksumType   = 'sha256'
  checksum64     = 'f7a8e542fe1986b42e8e4388d65b426810d03cd37516f077ebc2daf9c2d040b5'
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
