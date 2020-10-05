$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'hg'
  installerType  = 'exe'
  url            = 'https://www.mercurial-scm.org/release/windows/Mercurial-5.5.2-x86-python2.exe'
  url64          = 'https://www.mercurial-scm.org/release/windows/Mercurial-5.5.2-x64-python2.exe'
  checksum       = 'aeb0746839d075d04b113b680da21cb0a93a2d86f8822c9bde768fc71d8fb756'
  checksumType   = 'sha256'
  checksum64     = 'cd2b6ea421556d9cdc51f951710fd80815498ec01963295b27f6db5a4f46e862'
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
