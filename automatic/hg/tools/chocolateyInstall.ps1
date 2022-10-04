$ErrorActionPreference = 'Stop';

$packageArgs = @{
    packageName    = 'hg'
    installerType  = 'exe'
    url            = 'https://www.mercurial-scm.org/release/windows/Mercurial-6.2.2-x86.exe'
    url64          = 'https://www.mercurial-scm.org/release/windows/Mercurial-6.2.2-x64.exe'
    checksum       = '0018960056a08aea833381fba79d68eb6fe0c64a5322cf66de1a1323f68d83e8'
    checksumType   = 'sha256'
    checksum64     = 'dcdf691ab082b7c4358dedc5a0de46f33ea90be84613175a487b1efebc4d1df6'
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
