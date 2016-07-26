$packageName = 'spawner'
$url = 'https://downloads.sourceforge.net/project/spawner/spawner/spawner-0.2.4/spawner-0.2.4-win32-i386.zip'
$url64 = 'https://downloads.sourceforge.net/project/spawner/spawner/spawner-0.2.4/spawner-0.2.4-win64-x86_64.zip'

Install-ChocolateyZipPackage "$packageName" "$url" "$(Split-Path -parent $MyInvocation.MyCommand.Definition)" "$url64"