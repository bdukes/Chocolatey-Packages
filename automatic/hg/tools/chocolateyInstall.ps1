$ErrorActionPreference = 'Stop';

$packageArgs = @{
    packageName    = 'hg'
    installerType  = 'exe'
    url            = 'https://www.mercurial-scm.org/release/windows/Mercurial-6.1-x86.exe'
    url64          = 'https://www.mercurial-scm.org/release/windows/Mercurial-6.1-x64.exe'
    checksum       = 'd204d0a262476e1fa888439bd2a710c3bba3b8143945c7ba125afe8f3d7fac57'
    checksumType   = 'sha256'
    checksum64     = '4f648beb2706f7bd199596a99ba2486fd17a86f815f44fc1a7d44ae7084c1299'
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
