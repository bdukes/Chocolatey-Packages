$packageName = 'svn'
$installerType = 'msi'
$url = 'http://sourceforge.net/projects/win32svn/files/1.8.11/Setup-Subversion-1.8.11.msi'
$silentArgs = '/quiet'
$validExitCodes = @(0)

Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$url" -validExitCodes $validExitCodes
Install-ChocolateyPath "${env:ProgramFiles(x86)}\Subversion\bin"