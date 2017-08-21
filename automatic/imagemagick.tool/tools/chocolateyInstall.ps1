$packageArgs = @{
  packageName    = 'imagemagick.tool'
  url            = 'https://www.imagemagick.org/download/binaries/ImageMagick-7.0.6-9-portable-Q16-x86.zip'
  url64          = 'https://www.imagemagick.org/download/binaries/ImageMagick-7.0.6-9-portable-Q16-x64.zip'
  checksum       = 'a6fc2ab6e7deb9525462fd9498c649f6a1785ff77357c1edb4d78085bc6872f9'
  checksum64     = '0b465b2388fde0b6e2cd55de410ba2dfe5e5ef274d045055cf2dbae802343c7b'
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
