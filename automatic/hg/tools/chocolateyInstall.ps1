$ErrorActionPreference = 'Stop';

$packageArgs = @{
    packageName    = 'hg'
    installerType  = 'exe'
    url            = 'https://www.mercurial-scm.org/release/windows/Mercurial-5.6.1-x86-python2.exe'
    url64          = 'https://www.mercurial-scm.org/release/windows/Mercurial-5.6.1-x64-python2.exe'
    checksum       = 'fe73006ccc384a222e6d5f153a9fea123b6eaab1809196810dfe062a749f89ac'
    checksumType   = 'sha256'
    checksum64     = 'b856d70040aab218613c9b36f7f333fe1050c3498e053e103b88773d2bb977f5'
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
