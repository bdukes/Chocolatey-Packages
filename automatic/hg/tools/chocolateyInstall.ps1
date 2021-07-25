$ErrorActionPreference = 'Stop';

$packageArgs = @{
    packageName    = 'hg'
    installerType  = 'exe'
    url            = 'https://www.mercurial-scm.org/release/windows/Mercurial-5.8.1-x86.exe'
    url64          = 'https://www.mercurial-scm.org/release/windows/Mercurial-5.8.1-x64.exe'
    checksum       = '5daccd5cfaf66fb4639d3f9425e4aad0a331309add87c0a15f3b7c92e4f0964a'
    checksumType   = 'sha256'
    checksum64     = '829ffddabf75fe04467e07badcafc6ad63899cffde30a4920efa0ab66f0ad73a'
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
