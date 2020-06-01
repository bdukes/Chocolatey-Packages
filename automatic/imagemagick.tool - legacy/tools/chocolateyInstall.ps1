$packageArgs = @{
  packageName    = 'imagemagick.tool'
  url            = 'https://imagemagick.org/download/binaries/ImageMagick-6.9.11-16-portable-Q16-x86.zip'
  url64          = 'https://imagemagick.org/download/binaries/ImageMagick-6.9.11-16-portable-Q16-x64.zip'
  fallbackUrl    = 'https://ftp.icm.edu.pl/pub/graphics/ImageMagick/binaries/ImageMagick-6.9.11-16-portable-Q16-x86.zip'
  fallbackUrl64  = 'https://ftp.icm.edu.pl/pub/graphics/ImageMagick/binaries/ImageMagick-6.9.11-16-portable-Q16-x64.zip'
  checksum       = '02e9ac3dc6a90921ea203e3a7ed378ea657d0645a569e3dc7329ff52e1a8c723'
  checksum64     = '9d4aaeed4373d20b1b8c4ee07b5653d3c1c2ab14544afb4e4fddc302ce8694d8'
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
