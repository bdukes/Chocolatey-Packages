$packageName = 'DefaultProgramsEditor'
$url = 'http://defaultprogramseditor.com/download'
$url64 = $url
Install-ChocolateyZipPackage "$packageName" "$url" "$(Split-Path -parent $MyInvocation.MyCommand.Definition)" "$url64"