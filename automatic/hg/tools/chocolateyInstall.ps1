$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'hg'
  installerType  = 'exe'
  url            = 'https://www.mercurial-scm.org/release/windows/Mercurial-4.2.1.exe'
  url64          = 'https://www.mercurial-scm.org/release/windows/Mercurial-4.2.1-x64.exe'
  checksum       = '9ba315b5a473cba5a66d5d5ce35cfa3518954b24caaa3ca73aa518bb841406a8'
  checksumType   = 'sha256'
  checksum64     = '91cd606689ef9e0fa2a03342612b5c3ab5e3a6acc42b0444995cf2422fb16cdf'
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
