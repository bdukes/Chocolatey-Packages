$packageArgs = @{
  packageName    = 'imagemagick.tool'
  url            = 'https://www.imagemagick.org/download/binaries/ImageMagick-7.0.7-5-portable-Q16-x86.zip'
  url64          = 'https://www.imagemagick.org/download/binaries/ImageMagick-7.0.7-5-portable-Q16-x64.zip'
  checksum       = 'a5b830f33a735d842b648c6441958828e9fdf6e19a3f58a3117c94ce32b0aad7'
  checksum64     = '2fb80b684b2ba2bbe0fd585c6e9de96463fcfe889debd148c7618b74e052d199'
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
