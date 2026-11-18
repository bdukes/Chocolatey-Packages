$ErrorActionPreference = 'Stop';

$toolsDir = Split-Path -Parent $MyInvocation.MyCommand.Definition;

$packageArgs = @{
  packageName   = 'mob'
  url           = 'https://github.com/remotemobprogramming/mob/releases/download/v5.4.4/mob_v5.4.4_windows_amd64.tar.gz'
  checksum      = '64a8e6bdcb258a736b673a2886a16c0c2a358b54ba5d7e8eb2ec61ed496929f2'
  checksumType  = 'sha256'
  unzipLocation = $toolsDir
}

Install-ChocolateyZipPackage @packageArgs;

$tarFile = Get-Item "$toolsDir/*.tar";

Get-ChocolateyUnzip -FileFullPath $tarFile -Destination $toolsDir -PackageName $packageArgs.packageName;

Remove-Item $tarFile;
