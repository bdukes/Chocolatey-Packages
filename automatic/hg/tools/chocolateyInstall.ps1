$ErrorActionPreference = 'Stop';

$packageArgs = @{
    packageName    = 'hg'
    installerType  = 'exe'
    url            = 'https://www.mercurial-scm.org/release/windows/Mercurial-6.2-x86.exe'
    url64          = 'https://www.mercurial-scm.org/release/windows/Mercurial-6.2-x64.exe'
    checksum       = '38ffad89aa5594fb74578ea38469f68b78915c1e4914c364c796fb3212300835'
    checksumType   = 'sha256'
    checksum64     = '506240e788d02cab372821987ee5dfb7e71f5f76f4d4b818358b194153103fdc'
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
