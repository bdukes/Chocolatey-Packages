$packageArgs = @{
  packageName    = 'imagemagick.tool'
  url            = 'https://www.imagemagick.org/download/binaries/ImageMagick-6.9.9-47-portable-Q16-x86.zip'
  url64          = 'https://www.imagemagick.org/download/binaries/ImageMagick-6.9.9-47-portable-Q16-x64.zip'
  checksum       = 'dfdfee0b0d27e0e0128e7f23f2541021955c890de4317cef7162cfc667ae8f61'
  checksum64     = '2ce578dd7dddebb3084f7195e4f9906f7380d61fc3eb84caa17ca00c38978237'
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
