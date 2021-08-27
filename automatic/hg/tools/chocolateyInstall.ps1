$ErrorActionPreference = 'Stop';

$packageArgs = @{
    packageName    = 'hg'
    installerType  = 'exe'
    url            = 'https://www.mercurial-scm.org/release/windows/Mercurial-5.9-x86.exe'
    url64          = 'https://www.mercurial-scm.org/release/windows/Mercurial-5.9-x64.exe'
    checksum       = '69433085d7d4b664fb7ef2f92777e1f0a87fdc569ceda19202118c7ffd801c78'
    checksumType   = 'sha256'
    checksum64     = 'e8c9b7ec52645c062483e449ec5ff1de1c690e73af70f4d264c58beccce76ef2'
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
