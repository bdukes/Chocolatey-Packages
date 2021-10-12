$ErrorActionPreference = 'Stop';

$packageArgs = @{
    packageName    = 'hg'
    installerType  = 'exe'
    url            = 'https://www.mercurial-scm.org/release/windows/Mercurial-5.9.2-x86.exe'
    url64          = 'https://www.mercurial-scm.org/release/windows/Mercurial-5.9.2-x64.exe'
    checksum       = 'dd8e9b060aa53564f25fcff45855eefb81fcb2e2fd29491df52747996b1b51ce'
    checksumType   = 'sha256'
    checksum64     = '05f7b429e86dfd82e7105d3cecc7d0712e023479f291a9d8ba4daf65b5008590'
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
