$ErrorActionPreference = 'Stop';

$toolsDir = Split-Path -Parent $MyInvocation.MyCommand.Definition;

$packageArgs = @{
  packageName   = 'mob'
  url           = 'https://github.com/remotemobprogramming/mob/releases/download/v4.2.0/mob_v4.2.0_windows_amd64.tar.gz'
  checksum      = '463d47fec018e36589a8ab86f69ca6b67c559b45157da218bcbf6d349c61a505'
  checksumType  = 'sha256'
  unzipLocation = $toolsDir
}

Install-ChocolateyZipPackage @packageArgs;

$tarFile = Get-Item "$toolsDir/*.tar";

Get-ChocolateyUnzip -FileFullPath $tarFile -Destination $toolsDir -PackageName $packageArgs.packageName;

Remove-Item $tarFile;
