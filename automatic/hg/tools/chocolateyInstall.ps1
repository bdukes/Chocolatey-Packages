$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'hg'
  installerType  = 'exe'
  url            = 'https://www.mercurial-scm.org/release/windows/Mercurial-4.3.2.exe'
  url64          = 'https://www.mercurial-scm.org/release/windows/Mercurial-4.3.2-x64.exe'
  checksum       = '5c1dd5e856ad6a6298b6014c7b9f25b19aaa8979a9eb3b0469a6d9d0574ded78'
  checksumType   = 'sha256'
  checksum64     = '5a2281304fa6998427a8201d407746b03c82bb9840200209a70316cafd276bae'
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
