$packageName = 'imagemagick.tool'
$url = 'http://www.imagemagick.org/download/binaries/ImageMagick-6.8.7-1-Q16-x86-windows.zip'

try { 
  $installDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)" 
  Install-ChocolateyZipPackage $packageName $url $installDir
  Write-ChocolateySuccess "$packageName"
}
catch {
    try {
        $tempDir = "$env:TEMP\chocolatey\$packageName"
        if (-not (Test-Path $tempDir)) {New-Item $tempDir -ItemType directory}

        $listUrl = 'http://www.imagemagick.org/download/binaries/'
        $fileFullPath = "$tempDir\temp.html"

        # Obtain the download URL of the latest version using regex
        Get-ChocolateyWebFile 'HTML file containing the URL' $fileFullPath $listUrl
        $content = Select-String -Path $fileFullPath -Pattern 'zip' | Select-Object -First 1
        $url = $content -replace '.+(ImageMagick-)([\d-\.]{1,})(-Q16-x86-windows.zip).+', 'http://www.imagemagick.org/download/binaries/$1$2$3'
        $installDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

        Install-ChocolateyZipPackage $packageName $url $installDir

        Write-ChocolateySuccess $packageName
    } catch {
        Write-ChocolateyFailure $packageName "$($_.Exception.Message)"
        throw 
    }
}