$packageArgs = @{
  packageName    = 'imagemagick.tool'
  url            = 'https://imagemagick.org/download/binaries/ImageMagick-7.0.10-45-portable-Q16-x86.zip'
  url64          = 'https://imagemagick.org/download/binaries/ImageMagick-7.0.10-45-portable-Q16-x64.zip'
  fallbackUrl    = 'https://ftp.icm.edu.pl/pub/graphics/ImageMagick/binaries/ImageMagick-7.0.10-45-portable-Q16-x86.zip'
  fallbackUrl64  = 'https://ftp.icm.edu.pl/pub/graphics/ImageMagick/binaries/ImageMagick-7.0.10-45-portable-Q16-x64.zip'
  checksum       = '574c98333284f1bca376201de77ff0382bf5840c012581c74e4786103f8dc988'
  checksum64     = '71e832d88126d5a61f0fdeb7805231840493d7569798c035ad39d10ae70ff3bb'
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
