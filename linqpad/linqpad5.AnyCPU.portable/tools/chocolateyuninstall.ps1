

$ErrorActionPreference = 'Stop';

$packageName = 'linqpad5.AnyCPU.portable'
$zipFileName = 'LINQPad5-AnyCPU.zip'

UnInstall-ChocolateyZipPackage -PackageName $packageName -ZipFileName $zipFileName
