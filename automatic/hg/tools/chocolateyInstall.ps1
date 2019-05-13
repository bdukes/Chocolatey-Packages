$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'hg'
  installerType  = 'exe'
  url            = 'https://www.mercurial-scm.org/release/windows/Mercurial-5.0.exe'
  url64          = 'https://www.mercurial-scm.org/release/windows/Mercurial-5.0-x64.exe'
  checksum       = '2463ea17c543834c649ef2914ca4680fbd2045b56ac4f9b9f3857a64876bf1ec'
  checksumType   = 'sha256'
  checksum64     = 'f53b9c0e15bc7b445c4cb8aa76781a29badaaba4cc3dcff51aa4198190388118'
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
