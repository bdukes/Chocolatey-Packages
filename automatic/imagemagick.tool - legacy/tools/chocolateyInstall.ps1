$packageArgs = @{
  packageName    = 'imagemagick.tool'
  url            = 'https://imagemagick.org/download/binaries/ImageMagick-6.9.11-2-portable-Q16-x86.zip'
  url64          = 'https://imagemagick.org/download/binaries/ImageMagick-6.9.11-2-portable-Q16-x64.zip'
  checksum       = 'ae1d56ab01bb9660764a44b485e736931c8da874aeef69d98849ce728bdb9d57'
  checksum64     = 'a84a4f5bc8d49f1a3cca0eef2db459207087970561e7c0407ded8cb841b9f643'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
}

try {
    Get-WebHeaders $packageArgs.url
}
catch {
    $packageArgs.url = $packageArgs.url -replace 'https?://(?:www\.)?imagemagick.org/download/binaries/', 'http://ftp.icm.edu.pl/pub/graphics/ImageMagick/binaries/'
    $packageArgs.url64 = $packageArgs.url64 -replace 'https?://(?:www\.)?imagemagick.org/download/binaries/', 'http://ftp.icm.edu.pl/pub/graphics/ImageMagick/binaries/'
}

Install-ChocolateyZipPackage @packageArgs
