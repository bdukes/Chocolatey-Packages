$ErrorActionPreference = 'Stop';

$packageArgs = @{
    packageName    = 'hg'
    installerType  = 'exe'
    url            = 'https://www.mercurial-scm.org/release/windows/Mercurial-6.1.1-x86.exe'
    url64          = 'https://www.mercurial-scm.org/release/windows/Mercurial-6.1.1-x64.exe'
    checksum       = '53abdf619faccf5984e557d8266b3965e1286a469af3a302a77b7fd3ee1091f0'
    checksumType   = 'sha256'
    checksum64     = 'cb60c00a900fea9045eed88e47fb03628bd716b6385bad8e7f86579e990ea625'
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
