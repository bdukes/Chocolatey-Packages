$ErrorActionPreference = 'Stop';

$packageArgs = @{
    packageName    = 'hg'
    installerType  = 'exe'
    url            = 'https://www.mercurial-scm.org/release/windows/Mercurial-6.0-x86.exe'
    url64          = 'https://www.mercurial-scm.org/release/windows/Mercurial-6.0-x64.exe'
    checksum       = '7ffbb7f7f8154302c5627eff2fbcb7dd280ac027dc598c25720f63b393d54e8c'
    checksumType   = 'sha256'
    checksum64     = '5430ccf14817644cd44e84352cee2fee0c901ecd82065a63a469e471b67bdccf'
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
