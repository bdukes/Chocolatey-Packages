

$ErrorActionPreference = 'Stop';

$packageName = 'linqpad4.AnyCPU.portable'
$zipFileName = 'LINQPad4-AnyCPU.zip'

UnInstall-ChocolateyZipPackage -PackageName $packageName -ZipFileName $zipFileName
