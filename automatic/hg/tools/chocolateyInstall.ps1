$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'hg'
  installerType  = 'exe'
  url            = 'https://www.mercurial-scm.org/release/windows/Mercurial-5.0.2.exe'
  url64          = 'https://www.mercurial-scm.org/release/windows/Mercurial-5.0.2-x64.exe'
  checksum       = 'ac58482188cb5351d4777e449d17f36b49099a44db6ce7b4109aa6cae00dbc3c'
  checksumType   = 'sha256'
  checksum64     = 'bdeaa6a35bb975797b87722d01f186e8dca52c3cebcf37c96995af99cd0fcd04'
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
