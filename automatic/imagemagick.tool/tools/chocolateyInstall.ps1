$packageArgs = @{
  packageName    = 'imagemagick.tool'
  url            = 'https://imagemagick.org/download/binaries/ImageMagick-7.0.8-24-portable-Q16-x86.zip'
  url64          = 'https://imagemagick.org/download/binaries/ImageMagick-7.0.8-24-portable-Q16-x64.zip'
  checksum       = 'de62a2747e6c8685aa8f41fc5271a4c0bf645991f4b3236a4a67ac48c49e11e5'
  checksum64     = 'b0c63924fa2c448b1e4b5a3e3dcaa97d4a975969b4fe3577e628b358db87f953'
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
