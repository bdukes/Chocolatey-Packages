

$ErrorActionPreference = 'Stop';

$packageName = 'linqpad4.portable'
$zipFileName = 'LINQPad4.zip'

UnInstall-ChocolateyZipPackage -PackageName $packageName -ZipFileName $zipFileName
