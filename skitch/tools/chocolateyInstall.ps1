$packageName = 'skitch'
$installerType = 'exe'
$url = 'http://evernote.com/download/get.php?file=SkitchWindows'
$silentArgs = '--mode unattended'
$validExitCodes = @(0)

Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$url"  -validExitCodes $validExitCodes