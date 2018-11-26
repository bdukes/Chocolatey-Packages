$packageArgs = @{
  packageName    = 'imagemagick.tool'
  url            = 'https://imagemagick.org/download/binaries/ImageMagick-6.9.10-14-portable-Q16-x86.zip'
  url64          = 'https://imagemagick.org/download/binaries/ImageMagick-6.9.10-14-portable-Q16-x64.zip'
  checksum       = '5913e91a182164d90d374a282c8f70d827d0292f6845059679dfbeb1f411dc2f'
  checksum64     = 'c3b9bd799a93165860de2bfd156261ee46188592e01866547ca735964f0efe46'
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
