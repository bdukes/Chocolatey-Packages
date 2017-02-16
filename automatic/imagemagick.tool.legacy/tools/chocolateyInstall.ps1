$packageArgs = @{
  packageName    = 'imagemagick.tool'
  url            = 'https://www.imagemagick.org/download/binaries/ImageMagick-6.9.7-8-portable-Q16-x64.zip'
  url64          = 'https://www.imagemagick.org/download/binaries/ImageMagick-6.9.7-8-portable-Q16-x86.zip'
  checksum       = '6b7b8379dccdc3600357755800458eb2a7c511ad6b679338e6bb1e126c4dbd5a'
  checksum64     = '22b7d3772827d7ba7f406d4ca96ab1bfa7b34e6e717cddcdbfc9b2d88c2406cb'
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
