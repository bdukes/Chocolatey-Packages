$packageName = 'imagemagick.tool'
$url = 'http://www.imagemagick.org/download/binaries/ImageMagick-6.8.6-5-Q16-x86-windows.zip'
$url64 = $url

try { 
  $installDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)" 
  Install-ChocolateyZipPackage "$packageName" "$url" "$installDir" "$url64"
  Write-ChocolateySuccess "$packageName"
} catch {
  Write-ChocolateyFailure "$packageName" "$($_.Exception.Message)"
  throw 
}