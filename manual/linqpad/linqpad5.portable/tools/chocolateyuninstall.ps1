

$ErrorActionPreference = 'Stop';

$packageName = 'linqpad5.portable'
$zipFileName = 'LINQPad5.zip'

UnInstall-ChocolateyZipPackage -PackageName $packageName -ZipFileName $zipFileName
