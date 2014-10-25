$packageName = 'pscx'
$installerType = 'msi'
$url = 'https://pscx.codeplex.com/downloads/get/923562'
$silentArgs = '/quiet'
$validExitCodes = @(0)

Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$url" -validExitCodes $validExitCodes