$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'hg'
  installerType  = 'exe'
  url            = 'https://www.mercurial-scm.org/release/windows/Mercurial-5.1.exe'
  url64          = 'https://www.mercurial-scm.org/release/windows/Mercurial-5.1-x64.exe'
  checksum       = 'ac167791764c8ad6eb9b1ce07134582440286ff7960fd2f2eb3103cefb6e4b03'
  checksumType   = 'sha256'
  checksum64     = '93c9151b956b0759fbf0a3b4fc3ca5fc3a17c3c89a2d9aa7ad5ffdce9763eb38'
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
