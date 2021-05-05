$ErrorActionPreference = 'Stop';

$packageArgs = @{
    packageName    = 'hg'
    installerType  = 'exe'
    url            = 'https://www.mercurial-scm.org/release/windows/Mercurial-5.8-x86.exe'
    url64          = 'https://www.mercurial-scm.org/release/windows/Mercurial-5.8-x64.exe'
    checksum       = '808c2e61b075f65d9c473ce1c62e58f10713e3ba669435f975bedc28782e2cef'
    checksumType   = 'sha256'
    checksum64     = 'd1d6c4a6db02a86bcc6934aed10a4edd1085480697cf6dc2f3322d047d21ca58'
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
