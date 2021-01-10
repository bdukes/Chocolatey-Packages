$packageArgs = @{
  packageName    = 'imagemagick.tool'
  url            = 'https://download.imagemagick.org/ImageMagick/download/binaries/ImageMagick-7.0.10-57-portable-Q16-x86.zip'
  url64          = 'https://download.imagemagick.org/ImageMagick/download/binaries/ImageMagick-7.0.10-57-portable-Q16-x64.zip'
  fallbackUrl    = 'https://download.imagemagick.org/ImageMagick/download/binaries/ImageMagick-7.0.10-57-portable-Q16-x86.zip'
  fallbackUrl64  = 'https://download.imagemagick.org/ImageMagick/download/binaries/ImageMagick-7.0.10-57-portable-Q16-x64.zip'
  checksum       = 'e5d9f09ad0abacf79f5c151b051346010fe04f731157acb53d5a86f3b95499cb'
  checksum64     = 'a3344a2f0d47ffb850078a5c6de5a8183f55e6e2c9b643c584ad26c34d31d9d3'
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
