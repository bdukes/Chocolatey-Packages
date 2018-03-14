$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'hg'
  installerType  = 'exe'
  url            = 'https://www.mercurial-scm.org/release/windows/Mercurial-4.5.2.exe'
  url64          = 'https://www.mercurial-scm.org/release/windows/Mercurial-4.5.2-x64.exe'
  checksum       = 'fa498d6f30c83233873eb63e0bf6602e37d628e2a18ae63bf99c505a3e03ddab'
  checksumType   = 'sha256'
  checksum64     = '493c75e681a64481693d817e92f6b06dfadca6f8a7b120e3651ef518fe4ffa1b'
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
