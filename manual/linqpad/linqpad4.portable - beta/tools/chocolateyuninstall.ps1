

$ErrorActionPreference = 'Stop';

$packageName = 'linqpad4.portable'
$zipFileName = 'preview+LINQPad4.zip'

UnInstall-ChocolateyZipPackage -PackageName $packageName -ZipFileName $zipFileName
