$packageName = 'hg'
$installerType = 'msi'
$url = 'http://mercurial.selenic.com/release/windows/mercurial-3.2.2-x86.msi'
$url64 = 'http://mercurial.selenic.com/release/windows/mercurial-3.2.2-x64.msi'
$silentArgs = '/quiet'
$validExitCodes = @(0, 3010)

Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$url" "$url64"  -validExitCodes $validExitCodes

$installDir = (Get-ItemProperty HKCU:\Software\Mercurial\InstallDir).'(default)'
Install-ChocolateyPath $installDir