$ErrorActionPreference = 'Stop';

try {
    $regEntries = @(Get-ChildItem HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\ | Where-Object { $_.GetValue('DisplayName') -like 'Mercurial*' })
    foreach ($regEntry in $regEntries) {
        $installLocation = $regEntry.GetValue('InstallLocation')
        if ($installLocation) {
            Uninstall-ChocolateyPath $installLocation
        }
    }
}
catch {
    throw $_
}
