$ErrorActionPreference = 'Stop';

$packageArgs = @{
    packageName    = 'hg'
    installerType  = 'exe'
    url            = 'https://www.mercurial-scm.org/release/windows/Mercurial-5.9.3-x86.exe'
    url64          = 'https://www.mercurial-scm.org/release/windows/Mercurial-5.9.3-x64.exe'
    checksum       = '49fe2b3683026a04abf022fddfe9ea63a365ccff3e361a0a340971be88f4e068'
    checksumType   = 'sha256'
    checksum64     = 'c00be9755c183c474a2b4c4cf3bed48b01da8ffe1205946a2de8fadaaa4a40a0'
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
