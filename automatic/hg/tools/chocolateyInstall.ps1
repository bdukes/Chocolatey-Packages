$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'hg'
  installerType  = 'exe'
  url            = 'https://www.mercurial-scm.org/release/windows/Mercurial-5.1.1.exe'
  url64          = 'https://www.mercurial-scm.org/release/windows/Mercurial-5.1.1-x64.exe'
  checksum       = 'e27ec889c8e10a638d4f343af4f52da98c699639c51b7ac428a1b37d47750f40'
  checksumType   = 'sha256'
  checksum64     = '7892cf8ec21447d1d7d85ac89232b4bfde52a441014be6ca6c92446419d47db6'
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
