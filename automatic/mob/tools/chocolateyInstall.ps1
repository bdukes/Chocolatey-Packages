$ErrorActionPreference = 'Stop';

$toolsDir = Split-Path -Parent $MyInvocation.MyCommand.Definition;

$packageArgs = @{
  packageName   = 'mob'
  url           = 'https://github.com/remotemobprogramming/mob/releases/download/v3.1.1/mob_v3.1.1_windows_amd64.tar.gz'
  checksum      = 'fb0d8dcc90b4da5dc775c0116bbd89b6fdfe256662e37a07db05558b4e49e372'
  checksumType  = 'sha256'
  unzipLocation = $toolsDir
}

Install-ChocolateyZipPackage @packageArgs;

$tarFile = Get-Item "$toolsDir/*.tar";

Get-ChocolateyUnzip -FileFullPath $tarFile -Destination $toolsDir -PackageName $packageArgs.packageName;

Remove-Item $tarFile;
