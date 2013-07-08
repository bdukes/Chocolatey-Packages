$packageName = 'svn'
$installerType = 'msi'
$url = 'http://sourceforge.net/projects/win32svn/files/1.8.0/apache22/Setup-Subversion-1.8.0-1.msi'
$url64 = $url
$silentArgs = '/quiet'
$validExitCodes = @(0)

Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$url" "$url64"  -validExitCodes $validExitCodes