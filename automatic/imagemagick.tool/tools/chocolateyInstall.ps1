$packageArgs = @{
  packageName    = 'imagemagick.tool'
  url            = 'https://www.imagemagick.org/download/binaries/ImageMagick-7.0.3-6-portable-Q16-x64.zip'
  url64          = 'https://www.imagemagick.org/download/binaries/ImageMagick-7.0.3-6-portable-Q16-x86.zip'
  checksum       = 'b8a31b7591d416a824678252d9e148fc8a0b2f752f93eaabd82ae21b3bf60062'
  checksum64     = '2ceebe9c3dd8b416887959330335d997bf71a1c2c97efaa836b00052470b3410'
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
