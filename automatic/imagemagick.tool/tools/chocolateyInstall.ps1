$packageArgs = @{
  packageName    = 'imagemagick.tool'
  url            = 'https://imagemagick.org/download/binaries/ImageMagick-7.0.10-16-portable-Q16-x86.zip'
  url64          = 'https://imagemagick.org/download/binaries/ImageMagick-7.0.10-16-portable-Q16-x64.zip'
  fallbackUrl    = 'https://ftp.icm.edu.pl/pub/graphics/ImageMagick/binaries/ImageMagick-7.0.10-16-portable-Q16-x86.zip'
  fallbackUrl64  = 'https://ftp.icm.edu.pl/pub/graphics/ImageMagick/binaries/ImageMagick-7.0.10-16-portable-Q16-x64.zip'
  checksum       = '821d845b9749551bf951183a0ecbe76c2054afd90df4e70858df37b3e168358d'
  checksum64     = '91aa4725ff66ad51d934ce8b4b0de54dd1c3388de059d6d332a617926b16842b'
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
