$ErrorActionPreference = 'Stop';

$packageArgs = @{
    packageName    = 'hg'
    installerType  = 'exe'
    url            = 'https://www.mercurial-scm.org/release/windows/Mercurial-6.3.1-x86.exe'
    url64          = 'https://www.mercurial-scm.org/release/windows/Mercurial-6.3.1-x64.exe'
    checksum       = 'e2bec8a6b9bbe97c80fc16994920d25503cd8fcd53191f087f99d30fb1e354fc'
    checksumType   = 'sha256'
    checksum64     = 'be8bbadc156ad7f3bc46d7787d1eb681231cbe34c04c473becc2f9a69d2a09ee'
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
