$packageArgs = @{
  packageName    = 'imagemagick.tool'
  url            = 'https://www.imagemagick.org/download/binaries/ImageMagick-7.0.4-9-portable-Q16-x64.zip'
  url64          = 'https://www.imagemagick.org/download/binaries/ImageMagick-7.0.4-9-portable-Q16-x86.zip'
  checksum       = '0b2104b9c5b1e473ea06deee825c6506c3edb6fbf190e45f4fd3452fd5c3a908'
  checksum64     = '338c9873cb83e2821177d9d9363f5691bdbd94efb62ee465698fce116e9a514d'
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
