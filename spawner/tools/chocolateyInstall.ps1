$packageName = 'spawner'
$url = 'http://downloads.sourceforge.net/project/spawner/spawner/spawner-0.2.0/spawner-0.2.0-win32-i386.zip'
$url64 = 'http://downloads.sourceforge.net/project/spawner/spawner/spawner-0.2.0/spawner-0.2.0-win64-x86_64.zip'

Install-ChocolateyZipPackage "$packageName" "$url" "$(Split-Path -parent $MyInvocation.MyCommand.Definition)" "$url64"