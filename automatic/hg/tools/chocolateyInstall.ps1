$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'hg'
  installerType  = 'exe'
  url            = 'https://www.mercurial-scm.org/release/windows/Mercurial-4.4.1.exe'
  url64          = 'https://www.mercurial-scm.org/release/windows/Mercurial-4.4.1-x64.exe'
  checksum       = 'fd6b5790fb75c759d5b7f51972a6d6f60effb25f309869a74b3a9af561b775f0'
  checksumType   = 'sha256'
  checksum64     = '312887a720763843969006edfa66683a50051fae4177a9451423fdcb8af476cc'
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
