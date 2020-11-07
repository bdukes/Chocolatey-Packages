$ErrorActionPreference = 'Stop';

$packageArgs = @{
    packageName    = 'hg'
    installerType  = 'exe'
    url            = 'https://www.mercurial-scm.org/release/windows/Mercurial-5.6-x86-python2.exe'
    url64          = 'https://www.mercurial-scm.org/release/windows/Mercurial-5.6-x64-python2.exe'
    checksum       = 'c30bde65569b1b72a58fc498270f98de64938cee3ef588e7e57740f34a4dd779'
    checksumType   = 'sha256'
    checksum64     = '9f826cdc88ebdd5b7e2456fbd009ceeb08de371c31744940b009c256c5fda555'
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
