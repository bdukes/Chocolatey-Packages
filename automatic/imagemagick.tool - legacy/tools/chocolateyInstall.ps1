$packageArgs = @{
  packageName    = 'imagemagick.tool'
  url            = 'https://download.imagemagick.org/ImageMagick/download/binaries/ImageMagick-6.9.11-57-portable-Q16-x86.zip'
  url64          = 'https://download.imagemagick.org/ImageMagick/download/binaries/ImageMagick-6.9.11-57-portable-Q16-x64.zip'
  fallbackUrl    = 'https://download.imagemagick.org/ImageMagick/download/binaries/ImageMagick-6.9.11-57-portable-Q16-x86.zip'
  fallbackUrl64  = 'https://download.imagemagick.org/ImageMagick/download/binaries/ImageMagick-6.9.11-57-portable-Q16-x64.zip'
  checksum       = '7841e16a8d0843142370e78d55fee929f6877b5897e12c75135d2d216e7a0ef8'
  checksum64     = 'd4c904cf9da8645c5e61380deedc59c2a7e9ed761c708949dde1b497dba68e5e'
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
