$ErrorActionPreference = 'Stop';

$packageArgs = @{
    packageName    = 'hg'
    installerType  = 'exe'
    url            = 'https://www.mercurial-scm.org/release/windows/Mercurial-6.0.3-x86.exe'
    url64          = 'https://www.mercurial-scm.org/release/windows/Mercurial-6.0.3-x64.exe'
    checksum       = '742934b85974087576a7edb89af61dce9912f61dd8f821c12fe01b421a5b919d'
    checksumType   = 'sha256'
    checksum64     = '7d9c95064bd0272b1fa083024b9c4fcda2a74451a61cbacac289d92d1bba7032'
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
