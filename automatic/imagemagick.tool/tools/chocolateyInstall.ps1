$packageArgs = @{
  packageName    = 'imagemagick.tool'
  url            = 'https://www.imagemagick.org/download/binaries/ImageMagick-7.0.3-10-portable-Q16-x64.zip'
  url64          = 'https://www.imagemagick.org/download/binaries/ImageMagick-7.0.3-10-portable-Q16-x86.zip'
  checksum       = 'da8a0dd2525dbf71b831f5759ba7b0e3339ac59334981b370a46fc72ec62f64d'
  checksum64     = 'c2b985ac107020f3053a12efb92443072426b8138a4b0dffee796d781fc49fd3'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
}

try {
    Get-WebHeaders $packageArgs.url
}
catch {
    $packageArgs.url = $packageArgs.url -replace 'https://www.imagemagick.org/download/binaries/', 'http://ftp.icm.edu.pl/pub/graphics/ImageMagick/binaries/'
    $packageArgs.url64 = $packageArgs.url64 -replace 'https://www.imagemagick.org/download/binaries/', 'http://ftp.icm.edu.pl/pub/graphics/ImageMagick/binaries/'
}

Install-ChocolateyZipPackage @packageArgs
