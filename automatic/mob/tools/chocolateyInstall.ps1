$ErrorActionPreference = 'Stop';

$toolsDir = Split-Path -Parent $MyInvocation.MyCommand.Definition;

$packageArgs = @{
  packageName   = 'mob'
  url           = 'https://github.com/remotemobprogramming/mob/releases/download/5.4.3/mob_5.4.3_windows_amd64.tar.gz'
  checksum      = '26899e6d6d2ed8a14f2b71ec259dbcb70ce568abbc092ac8f28c49629c78f7f2'
  checksumType  = 'sha256'
  unzipLocation = $toolsDir
}

Install-ChocolateyZipPackage @packageArgs;

$tarFile = Get-Item "$toolsDir/*.tar";

Get-ChocolateyUnzip -FileFullPath $tarFile -Destination $toolsDir -PackageName $packageArgs.packageName;

Remove-Item $tarFile;
