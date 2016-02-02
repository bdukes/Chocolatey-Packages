

$ErrorActionPreference = 'Stop';

$packageName = 'linqpad5.AnyCPU.portable'
$zipFileName = 'preview+LINQPad5-AnyCPU.zip'

UnInstall-ChocolateyZipPackage -PackageName $packageName -ZipFileName $zipFileName
