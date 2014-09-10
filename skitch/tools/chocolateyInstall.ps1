$packageName = 'skitch'
$installerType = 'exe'
$url = 'http://evernote.com/download/get.php?file=SkitchWindows'
$url64 = $url
$silentArgs = '--mode unattended'
$validExitCodes = @(0)

Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$url" "$url64"  -validExitCodes $validExitCodes