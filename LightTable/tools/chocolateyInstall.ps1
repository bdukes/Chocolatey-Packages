$packageName = 'LightTable'
$url = 'https://d35ac8ww5dfjyg.cloudfront.net/playground/bins/0.6.6/LightTableWin.zip'

Install-ChocolateyZipPackage "$packageName" "$url" "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"