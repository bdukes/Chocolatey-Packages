$packageName = 'hg'
$installerType = 'exe'
$url = 'http://mercurial.selenic.com/release/windows/Mercurial-3.2.3.exe'
$url64 = 'http://mercurial.selenic.com/release/windows/Mercurial-3.2.3-x64.exe'
$silentArgs = '/VERYSILENT'
$validExitCodes = @(0, 3010)

Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$url" "$url64"  -validExitCodes $validExitCodes

$installDir = (Get-ItemProperty HKCU:\Software\Mercurial\InstallDir).'(default)'
Install-ChocolateyPath $installDir