$packageName = 'svn'
$installerType = 'msi'
$url = 'http://sourceforge.net/projects/win32svn/files/1.8.13/Setup-Subversion-1.8.13.msi'
$silentArgs = '/quiet'
$validExitCodes = @(0)

Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$url" -validExitCodes $validExitCodes

$installDir = (Get-ItemProperty 'HKCU:\Software\Microsoft\Windows\CurrentVersion\App Paths\svn.exe').Path
Install-ChocolateyPath $installDir