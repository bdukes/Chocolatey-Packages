$packageArgs = @{
  packageName    = 'imagemagick.tool'
  url            = 'https://download.imagemagick.org/ImageMagick/download/binaries/ImageMagick-7.0.11-2-portable-Q16-x86.zip'
  url64          = 'https://download.imagemagick.org/ImageMagick/download/binaries/ImageMagick-7.0.11-2-portable-Q16-x64.zip'
  fallbackUrl    = 'https://download.imagemagick.org/ImageMagick/download/binaries/ImageMagick-7.0.11-2-portable-Q16-x86.zip'
  fallbackUrl64  = 'https://download.imagemagick.org/ImageMagick/download/binaries/ImageMagick-7.0.11-2-portable-Q16-x64.zip'
  checksum       = '56960cc58fc552bd04d4fe6fb54a581255c97d1211f5096448a4474e19f72bce'
  checksum64     = 'be35276fcf53f2ee949aa4a87790eea3d5015208c0ddca6c8218d4c75ad49917'
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
