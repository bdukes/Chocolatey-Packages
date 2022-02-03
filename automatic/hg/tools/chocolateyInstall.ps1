$ErrorActionPreference = 'Stop';

$packageArgs = @{
    packageName    = 'hg'
    installerType  = 'exe'
    url            = 'https://www.mercurial-scm.org/release/windows/Mercurial-6.0.2-x86.exe'
    url64          = 'https://www.mercurial-scm.org/release/windows/Mercurial-6.0.2-x64.exe'
    checksum       = 'a56e51231cbebcf1c06f3a1b34295952c9f3bb35fe37a54ee577be92b2a054b8'
    checksumType   = 'sha256'
    checksum64     = '6367f8632bf083379de8d4686da74fa43cf9da96fcb5f57c1c421756453a1ba3'
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
