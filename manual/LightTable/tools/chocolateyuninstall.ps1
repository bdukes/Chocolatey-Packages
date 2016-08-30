

$ErrorActionPreference = 'Stop';

$packageName = 'lighttable'
$zipFileName = 'lighttable-0.8.1-windows.zip'

UnInstall-ChocolateyZipPackage -PackageName $packageName -ZipFileName $zipFileName
