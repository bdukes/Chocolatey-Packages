$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'hg'
  installerType  = 'exe'
  url            = 'https://www.mercurial-scm.org/release/windows/Mercurial-4.3.1.exe'
  url64          = 'https://www.mercurial-scm.org/release/windows/Mercurial-4.3.1-x64.exe'
  checksum       = 'bcff7f0ed117f07933a99a240f79e55b0fcfc5580475ad7f3c03dadd4d9a1d7d'
  checksumType   = 'sha256'
  checksum64     = 'cf34ff6f1acaf4af7390555906ba4906361d5e0e47c316ac110836b94b0337cc'
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
