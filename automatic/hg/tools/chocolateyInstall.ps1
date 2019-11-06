$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'hg'
  installerType  = 'exe'
  url            = 'https://www.mercurial-scm.org/release/windows/Mercurial-5.2.exe'
  url64          = 'https://www.mercurial-scm.org/release/windows/Mercurial-5.2-x64.exe'
  checksum       = '802623e06201c4b842a8e01c7064a05ff664b5d5e3948d92985148e6aa14a48f'
  checksumType   = 'sha256'
  checksum64     = 'db4c88932dc0009f1719b49bd09f0f7e4531671ab38f42fe59d84239d3978fcf'
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
