$packageName = 'hg'
$installerType = 'msi'
$url = 'http://mercurial.selenic.com/release/windows/mercurial-3.1.0-x86.msi'
$url64 = 'http://mercurial.selenic.com/release/windows/mercurial-3.1.0-x64.msi'
$silentArgs = '/quiet'
$validExitCodes = @(0)

Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$url" "$url64"  -validExitCodes $validExitCodes
Install-ChocolateyPath "$env:SystemDrive\Program Files\Mercurial"