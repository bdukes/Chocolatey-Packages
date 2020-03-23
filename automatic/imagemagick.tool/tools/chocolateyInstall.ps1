$packageArgs = @{
  packageName    = 'imagemagick.tool'
  url            = 'https://imagemagick.org/download/binaries/ImageMagick-7.0.10-2-portable-Q16-x86.zip'
  url64          = 'https://imagemagick.org/download/binaries/ImageMagick-7.0.10-2-portable-Q16-x64.zip'
  checksum       = 'f8ff140a993aad00714d5a9ddfe18059a29350026fc77903128f0d77114ebf85'
  checksum64     = '498cad8469e43caeeb94fd58bb9026e5deaba9637a1fbfc4ea00530f13cc0ff6'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
}

try {
    Get-WebHeaders $packageArgs.url
}
catch {
    $packageArgs.url = $packageArgs.url -replace 'https?://(?:www\.)?imagemagick.org/download/binaries/', 'http://ftp.icm.edu.pl/pub/graphics/ImageMagick/binaries/'
    $packageArgs.url64 = $packageArgs.url64 -replace 'https?://(?:www\.)?imagemagick.org/download/binaries/', 'http://ftp.icm.edu.pl/pub/graphics/ImageMagick/binaries/'
}

Install-ChocolateyZipPackage @packageArgs
