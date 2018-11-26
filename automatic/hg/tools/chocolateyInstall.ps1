$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'hg'
  installerType  = 'exe'
  url            = 'https://www.mercurial-scm.org/release/windows/Mercurial-4.8.exe'
  url64          = 'https://www.mercurial-scm.org/release/windows/Mercurial-4.8-x64.exe'
  checksum       = '2bf36cbd60af21600d9a296b8ec2d00131cbd92acbaf56511cb0d7de6e2a5910'
  checksumType   = 'sha256'
  checksum64     = '21812cf412b13cbb6f1ac0ca96ca047a9bdbfc2bcfb9d44cc6d85b16572f4837'
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
