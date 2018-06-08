$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'hg'
  installerType  = 'exe'
  url            = 'https://www.mercurial-scm.org/release/windows/Mercurial-4.6.1.exe'
  url64          = 'https://www.mercurial-scm.org/release/windows/Mercurial-4.6.1-x64.exe'
  checksum       = 'b5b09f3b37d0a44a6923afa8951191bd328084ff8e678b4759559f607e0f739d'
  checksumType   = 'sha256'
  checksum64     = '1ac01e7b090ce87eea98c29241f6c71f93b9a8af7ddb8b78c9fe61050c6c9baf'
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
