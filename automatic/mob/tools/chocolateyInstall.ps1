$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = 'mob'
  url           = 'https://github.com/remotemobprogramming/mob/releases/download/v3.0.0/mob_v3.0.0_windows_amd64.tar.gz'
  checksum      = 'fb94ef338d44de002653818dcb52504906161561713d4d0430061fb68c888d22'
  checksumType  = 'sha256'
  unzipLocation = (Split-Path -Parent $MyInvocation.MyCommand.Definition)
}

Install-ChocolateyZipPackage @packageArgs;
