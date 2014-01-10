$packageName = 'LightTable' # arbitrary name for the package, used in messages
$url = 'http://d35ac8ww5dfjyg.cloudfront.net/playground/bins/0.6.0/LightTableWin.zip' # download url

Install-ChocolateyZipPackage "$packageName" "$url" "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"