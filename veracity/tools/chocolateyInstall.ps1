$packageName = 'veracity'
$installerType = 'msi'
$url = 'http://download.sourcegear.com/Veracity/release/2.5.0.11065/veracity_2.5.0.11065_x86.msi'
$url64 = 'http://download.sourcegear.com/Veracity/release/2.5.0.11065/veracity_2.5.0.11065_x64.msi'
$silentArgs = '/quiet'
$validExitCodes = @(0)
Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$url" "$url64"  -validExitCodes $validExitCodes