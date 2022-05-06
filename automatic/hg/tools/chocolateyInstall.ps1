$ErrorActionPreference = 'Stop';

$packageArgs = @{
    packageName    = 'hg'
    installerType  = 'exe'
    url            = 'https://www.mercurial-scm.org/release/windows/Mercurial-6.1.2-x86.exe'
    url64          = 'https://www.mercurial-scm.org/release/windows/Mercurial-6.1.2-x64.exe'
    checksum       = '4f05af0964634981b08599ee54be6e3a6d57e1ab24e41c1529d7689e9f999e86'
    checksumType   = 'sha256'
    checksum64     = 'fd74e358ba3a14f3cebea478f2f8ec4eaef5add8be931cd3cced6fc5460c2b6c'
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
