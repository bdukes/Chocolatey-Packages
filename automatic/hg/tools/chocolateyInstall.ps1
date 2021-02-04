$ErrorActionPreference = 'Stop';

$packageArgs = @{
    packageName    = 'hg'
    installerType  = 'exe'
    url            = 'https://www.mercurial-scm.org/release/windows/Mercurial-5.7-x86-python2.exe'
    url64          = 'https://www.mercurial-scm.org/release/windows/Mercurial-5.7-x64-python2.exe'
    checksum       = '11758d235cb4bb3264fed24eb0ed7547f3e748791388a16a289e7dde82823ef5'
    checksumType   = 'sha256'
    checksum64     = '01543395120eeac52dfc31fe5446aa4a32594075ef30294b8046805e5cdc0a45'
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
