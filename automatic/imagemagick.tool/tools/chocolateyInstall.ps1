$packageArgs = @{
  packageName    = 'imagemagick.tool'
  url            = 'https://www.imagemagick.org/download/binaries/ImageMagick-7.0.3-5-portable-Q16-x64.zip'
  url64          = 'https://www.imagemagick.org/download/binaries/ImageMagick-7.0.3-5-portable-Q16-x86.zip'
  checksum       = '6c935bd6934351bc28f96e40f49cec6b47d21953019a410b4c115d42782dde41'
  checksum64     = '143ea031bc3982be2ba1368b081b3cdb39e27dc744bb4dec06495d58e564b546'
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
