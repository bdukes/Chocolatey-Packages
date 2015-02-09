try {
    $regEntry = Get-ChildItem HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\ | ? { $_.GetValue('DisplayName') -like 'Mercurial*' }
    if ($regEntry) {
        $uninstallCommand = $regEntry.GetValue('QuietUninstallString')
        & $uninstallCommand
    }
} catch {
    throw $_
}