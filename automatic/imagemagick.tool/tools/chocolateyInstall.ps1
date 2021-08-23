$packageArgs = @{
  packageName    = 'imagemagick.tool'
  url            = 'https://download.imagemagick.org/ImageMagick/download/binaries/ImageMagick-7.1.0-5-portable-Q16-x86.zip'
  url64          = 'https://download.imagemagick.org/ImageMagick/download/binaries/ImageMagick-7.1.0-5-portable-Q16-x64.zip'
  fallbackUrl    = 'https://ftp.icm.edu.pl/pub/graphics/ImageMagick/binaries/ImageMagick-7.1.0-5-portable-Q16-x86.zip'
  fallbackUrl64  = 'https://ftp.icm.edu.pl/pub/graphics/ImageMagick/binaries/ImageMagick-7.1.0-5-portable-Q16-x64.zip'
  checksum       = '6317eadfafd770f493272e1e92cf1d814c87da21ec54398f08a2837f4d26ec00'
  checksum64     = '3ebab672e9b06a5c259254ddd270fb796ab05836606eb7b3e134060a0c677897'
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
