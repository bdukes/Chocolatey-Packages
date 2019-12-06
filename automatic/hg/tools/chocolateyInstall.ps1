$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'hg'
  installerType  = 'exe'
  url            = 'https://www.mercurial-scm.org/release/windows/Mercurial-5.2.1.exe'
  url64          = 'https://www.mercurial-scm.org/release/windows/Mercurial-5.2.1-x64.exe'
  checksum       = 'abc61583c18e92064e558fe5fd0001c100e8ab58ff7f1341b1ebdd6e6d9592cb'
  checksumType   = 'sha256'
  checksum64     = 'de937461b5b0daec12bca6ee326e18082d49c32e6a3410f639cf291e3f755fdf'
  checksumType64 = 'sha256'
  silentArgs     = '/VERYSILENT'
  validExitCodes = @(0, 3010)
}


Install-ChocolateyPackage @packageArgs

try {
    $regEntries = @(Get-ChildItem HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\ | ? { $_.GetValue('DisplayName') -like 'Mercurial*' })
    foreach ($regEntry in $regEntries) {
        $installLocation = $regEntry.GetValue('InstallLocation')
        if ($installLocation) {
            Install-ChocolateyPath $installLocation
        }
    }
} catch {
    throw $_
}
