$ErrorActionPreference = 'Stop';

$packageArgs = @{
    packageName    = 'hg'
    installerType  = 'exe'
    url            = 'https://www.mercurial-scm.org/release/windows/Mercurial-6.0.1-x86.exe'
    url64          = 'https://www.mercurial-scm.org/release/windows/Mercurial-6.0.1-x64.exe'
    checksum       = '86dbdf1e848d83958967cff2cd4c6fe178dc51fefdd5540d26347be33c8c35d2'
    checksumType   = 'sha256'
    checksum64     = '39b1fee248080ff102430c27b09f6ba16f6c58b34384f464e4e44ae8d43217b0'
    checksumType64 = 'sha256'
    silentArgs     = '/VERYSILENT'
    validExitCodes = @(0, 3010)
}


Install-ChocolateyPackage @packageArgs

try {
    $regEntries = @(Get-ChildItem HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\ | Where-Object { $_.GetValue('DisplayName') -like 'Mercurial*' })
    foreach ($regEntry in $regEntries) {
        $installLocation = $regEntry.GetValue('InstallLocation')
        if ($installLocation) {
            Install-ChocolateyPath $installLocation
        }
    }
}
catch {
    throw $_
}
