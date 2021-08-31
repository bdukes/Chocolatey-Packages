$ErrorActionPreference = 'Stop';

$packageArgs = @{
    packageName    = 'hg'
    installerType  = 'exe'
    url            = 'https://www.mercurial-scm.org/release/windows/Mercurial-5.9.1-x86.exe'
    url64          = 'https://www.mercurial-scm.org/release/windows/Mercurial-5.9.1-x64.exe'
    checksum       = '87836f0cce128015b147912adf74892710784df05483efe6da7d95960f3e9419'
    checksumType   = 'sha256'
    checksum64     = '56fee96091f0dd67719e6e872415de6191bd767068a87feb59906b44b38dceb2'
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
