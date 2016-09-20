$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = 'hg'
  installerType = 'exe'
  url           = 'https://www.mercurial-scm.org/release/windows/Mercurial-3.9.1.exe'
  url64bit      = 'https://www.mercurial-scm.org/release/windows/Mercurial-3.9.1-x64.exe'
  checksum      = '68284536732A13D2238BCB73EAC67C4248D5370F8FCA0DB7C4DA8159C5BA9BA0'
  checksumType  = 'sha256'
  checksum64    = 'E7381588237965503644383ED8322A0072A6899D1C35D606A065B1CBE01B15D7'
  checksumType64= 'sha256'
  silentArgs    = '/VERYSILENT'
  validExitCodes= @(0, 3010)
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