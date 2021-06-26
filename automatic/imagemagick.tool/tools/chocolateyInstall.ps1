$packageArgs = @{
  packageName    = 'imagemagick.tool'
  url            = 'https://download.imagemagick.org/ImageMagick/download/binaries/ImageMagick-7.1.0-2-portable-Q16-x86.zip'
  url64          = 'https://download.imagemagick.org/ImageMagick/download/binaries/ImageMagick-7.1.0-2-portable-Q16-x64.zip'
  fallbackUrl    = 'https://ftp.icm.edu.pl/pub/graphics/ImageMagick/binaries/ImageMagick-7.1.0-2-portable-Q16-x86.zip'
  fallbackUrl64  = 'https://ftp.icm.edu.pl/pub/graphics/ImageMagick/binaries/ImageMagick-7.1.0-2-portable-Q16-x64.zip'
  checksum       = '9e6e1497369beccdb1cd999d9b362673348e6b338a74b2d4cc4545639da90ecd'
  checksum64     = 'facbf2abed8870fe0da3e7f8b6041468791acc7e139af119b4632effa9a45d95'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
}

try {
    Get-WebHeaders $packageArgs.url
}
catch {
    $packageArgs.url = $packageArgs.fallbackUrl
    $packageArgs.url64 = $packageArgs.fallbackUrl64
}

Install-ChocolateyZipPackage @packageArgs
