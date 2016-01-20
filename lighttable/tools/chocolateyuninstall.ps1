

$ErrorActionPreference = 'Stop';

$packageName = 'lighttable'
$zipFileName = 'lighttable-0.8.0-alpha-windows.zip'

UnInstall-ChocolateyZipPackage -PackageName $packageName -ZipFileName $zipFileName
