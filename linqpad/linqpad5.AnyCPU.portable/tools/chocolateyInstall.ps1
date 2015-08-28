$packageName = 'linqpad5.AnyCPU.portable'
$url = 'http://www.linqpad.net/GetFile.aspx?LINQPad5-AnyCPU.zip'

try {
  $installDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

  Install-ChocolateyZipPackage "$packageName" "$url" "$installDir"
} catch {
  Write-ChocolateyFailure "$packageName" "$($_.Exception.Message)"
  throw
}
