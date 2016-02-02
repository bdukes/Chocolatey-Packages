

$ErrorActionPreference = 'Stop';

$packageName = 'linqpad5.portable'
$zipFileName = 'preview+LINQPad5.zip'

UnInstall-ChocolateyZipPackage -PackageName $packageName -ZipFileName $zipFileName
