$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'hg'
  installerType  = 'exe'
  url            = 'https://www.mercurial-scm.org/release/windows/Mercurial-4.1.2.exe'
  url64          = 'https://www.mercurial-scm.org/release/windows/Mercurial-4.1.2-x64.exe'
  checksum       = '68e797a2d0440f6ca6c67972dd4b85ab93d267e011c177b7ed3199c00a4a8c12'
  checksumType   = 'sha256'
  checksum64     = '518e17c004ec91d3de8098ceea2fdc68555f64d28388dc4aeecf80b61355c262'
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
