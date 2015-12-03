try {
    $packageName = 'hg'
    $installerType = 'exe'
    $url = 'https://mercurial.selenic.com/release/windows/Mercurial-3.6.2.exe'
    $url64 = 'https://mercurial.selenic.com/release/windows/Mercurial-3.6.2-x64.exe'
    $silentArgs = '/VERYSILENT'
    $validExitCodes = @(0, 3010)

    Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$url" "$url64" -validExitCodes $validExitCodes

    $regEntries = @(Get-ChildItem HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\ | ? { $_.GetValue('DisplayName') -like 'Mercurial*' })
    foreach ($regEntry in $regEntries) {
      Install-ChocolateyPath $regEntry.GetValue('InstallLocation')
    }
} catch {
    throw $_
}