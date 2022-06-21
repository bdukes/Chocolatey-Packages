$ErrorActionPreference = 'Stop';

$packageArgs = @{
    packageName    = 'hg'
    installerType  = 'exe'
    url            = 'https://www.mercurial-scm.org/release/windows/Mercurial-6.1.4-x86.exe'
    url64          = 'https://www.mercurial-scm.org/release/windows/Mercurial-6.1.4-x64.exe'
    checksum       = 'ac6fdc5c91770957ca7867257584dde358370fbc9ec070a4452bfbff1d42de99'
    checksumType   = 'sha256'
    checksum64     = '4dfe36d78a65c76bcbf3d0436aabdd6101e93f5371fb27fef6994d0728fc14e1'
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
