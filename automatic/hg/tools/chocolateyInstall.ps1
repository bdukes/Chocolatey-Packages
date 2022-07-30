$ErrorActionPreference = 'Stop';

$packageArgs = @{
    packageName    = 'hg'
    installerType  = 'exe'
    url            = 'https://www.mercurial-scm.org/release/windows/Mercurial-6.2.1-x86.exe'
    url64          = 'https://www.mercurial-scm.org/release/windows/Mercurial-6.2.1-x64.exe'
    checksum       = '3fd38de69b19f158b1174ddd41ec8bf3ceb4698c94c66ea94a8bf880d97370d2'
    checksumType   = 'sha256'
    checksum64     = 'd6c8a7833d387ea65740f60c1b210b50177fcc9ede296af241971dc1decafb75'
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
