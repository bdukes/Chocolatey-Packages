$ErrorActionPreference = 'Stop';

$packageArgs = @{
    packageName    = 'hg'
    installerType  = 'exe'
    url            = 'https://www.mercurial-scm.org/release/windows/Mercurial-5.7.1-x86.exe'
    url64          = 'https://www.mercurial-scm.org/release/windows/Mercurial-5.7.1-x64.exe'
    checksum       = 'd9ec9c5c872ecd13dc43aa3b7ca065118b2bbb21cbacdda1dc0e1fc7bfab8712'
    checksumType   = 'sha256'
    checksum64     = 'f5e06aa96e468cc61948f1ce16b8f650d50d8b8059e8e0c4b93ea7a17258f764'
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
