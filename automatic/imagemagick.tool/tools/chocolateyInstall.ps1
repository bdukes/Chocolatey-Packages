$packageArgs = @{
  packageName    = 'imagemagick.tool'
  url            = 'https://download.imagemagick.org/ImageMagick/download/binaries/ImageMagick-7.0.10-60-portable-Q16-x86.zip'
  url64          = 'https://download.imagemagick.org/ImageMagick/download/binaries/ImageMagick-7.0.10-60-portable-Q16-x64.zip'
  fallbackUrl    = 'https://download.imagemagick.org/ImageMagick/download/binaries/ImageMagick-7.0.10-60-portable-Q16-x86.zip'
  fallbackUrl64  = 'https://download.imagemagick.org/ImageMagick/download/binaries/ImageMagick-7.0.10-60-portable-Q16-x64.zip'
  checksum       = '6b522e7c9a86e14e7996a564e28937cc4633d5102878ef002cce86cf83d66eda'
  checksum64     = '830ac5ea2f8ab6f4ed2e9949d61a5b4924e563f30686c1b45f486101d3d176c8'
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
