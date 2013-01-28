$packageName = 'spawner' # arbitrary name for the package, used in messages
$url = 'http://downloads.sourceforge.net/project/spawner/spawner/spawner-0.1.8/spawner-0.1.8-win32-x86_64.zip'
$url64 = $url

Install-ChocolateyZipPackage "$packageName" "$url" "$(Split-Path -parent $MyInvocation.MyCommand.Definition)" "$url64"