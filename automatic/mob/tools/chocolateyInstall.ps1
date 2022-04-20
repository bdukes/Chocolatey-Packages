$ErrorActionPreference = 'Stop';

$toolsDir = Split-Path -Parent $MyInvocation.MyCommand.Definition;

$packageArgs = @{
  packageName   = 'mob'
  url           = 'https://github.com/remotemobprogramming/mob/releases/download/v3.1.0/mob_v3.1.0_windows_amd64.tar.gz'
  checksum      = '5c1fdd20d42bde0c5cb273fa2bb7681f213c3b5571ed5add478b17150cc59c6b'
  checksumType  = 'sha256'
  unzipLocation = $toolsDir
}

Install-ChocolateyZipPackage @packageArgs;

$tarFile = Get-Item "$toolsDir/*.tar";

Get-ChocolateyUnzip -FileFullPath $tarFile -Destination $toolsDir -PackageName $packageArgs.packageName;

Remove-Item $tarFile;
