$packageArgs = @{
  packageName    = 'imagemagick.tool'
  url            = 'https://www.imagemagick.org/download/binaries/ImageMagick-6.9.9-34-portable-Q16-x86.zip'
  url64          = 'https://www.imagemagick.org/download/binaries/ImageMagick-6.9.9-34-portable-Q16-x64.zip'
  checksum       = '6ce21af5347346e988d958506f1bbd7a30112e6320c1b29928ce0087ef2a34c7'
  checksum64     = '96262c967c9cf3e104c333e98720ccb13726567cae14cc5f47e95a1af9ec9d8e'
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
