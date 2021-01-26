$packageArgs = @{
  packageName    = 'imagemagick.tool'
  url            = 'https://download.imagemagick.org/ImageMagick/download/binaries/ImageMagick-6.9.11-60-portable-Q16-x86.zip'
  url64          = 'https://download.imagemagick.org/ImageMagick/download/binaries/ImageMagick-6.9.11-60-portable-Q16-x64.zip'
  fallbackUrl    = 'https://download.imagemagick.org/ImageMagick/download/binaries/ImageMagick-6.9.11-60-portable-Q16-x86.zip'
  fallbackUrl64  = 'https://download.imagemagick.org/ImageMagick/download/binaries/ImageMagick-6.9.11-60-portable-Q16-x64.zip'
  checksum       = 'c1891155a7ee94e3ca4d169b6cf8c0804e95f0c693c4fbe7023789f9f2bb7e83'
  checksum64     = '9f5220f13d3acf34058434a83b5b060ba319359b91b15d3a412b83f7ef46488c'
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
