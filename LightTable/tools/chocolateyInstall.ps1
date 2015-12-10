$packageName = 'LightTable'
$url = 'https://github.com/LightTable/LightTable/releases/download/0.8.0-alpha/lighttable-0.8.0-alpha-windows.zip'

Install-ChocolateyZipPackage "$packageName" "$url" "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"