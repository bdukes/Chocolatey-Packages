$ErrorActionPreference = 'Stop';

$packageArgs = @{
    packageName    = 'hg'
    installerType  = 'exe'
    url            = 'https://www.mercurial-scm.org/release/windows/Mercurial-6.1.3-x86.exe'
    url64          = 'https://www.mercurial-scm.org/release/windows/Mercurial-6.1.3-x64.exe'
    checksum       = '48dcafa5b6d1cdd9642261890caac357dc93e8a95b3b23494d61da129df1a235'
    checksumType   = 'sha256'
    checksum64     = '7aa584bd55e33daaf5f1430b74afa9f068eaef25777868f0a8a738d120913e44'
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
