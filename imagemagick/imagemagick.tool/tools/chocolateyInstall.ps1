$packageName = 'imagemagick.tool'
$url = 'http://www.imagemagick.org/download/binaries/ImageMagick-6.9.2-0-portable-Q16-x86.zip'
$url64 = 'http://www.imagemagick.org/download/binaries/ImageMagick-6.9.2-0-portable-Q16-x64.zip'
$installDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)" 

try { 
  Install-ChocolateyZipPackage $packageName $url $installDir $url64
}
catch {
    $url = 'http://ftp.sunet.se/pub/multimedia/graphics/ImageMagick/binaries/ImageMagick-6.9.2-0-portable-Q16-x86.zip'
    $url64 = 'http://ftp.sunet.se/pub/multimedia/graphics/ImageMagick/binaries/ImageMagick-6.9.2-0-portable-Q16-x64.zip'
    Install-ChocolateyZipPackage $packageName $url $installDir $url64
}