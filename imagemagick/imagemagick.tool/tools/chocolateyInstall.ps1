$packageName = 'imagemagick.tool'
$url = 'http://www.imagemagick.org/download/binaries/ImageMagick-7.0.1-5-portable-Q16-x86.zip'
$url64 = 'http://www.imagemagick.org/download/binaries/ImageMagick-7.0.1-5-portable-Q16-x64.zip'
$installDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

try {
    Install-ChocolateyZipPackage $packageName $url $installDir $url64
}
catch {
    $url = 'http://ftp.icm.edu.pl/pub/graphics/ImageMagick/binaries/ImageMagick-7.0.1-5-portable-Q16-x86.zip'
    $url64 = 'http://ftp.icm.edu.pl/pub/graphics/ImageMagick/binaries/ImageMagick-7.0.1-5-portable-Q16-x64.zip'
    Install-ChocolateyZipPackage $packageName $url $installDir $url64
}
