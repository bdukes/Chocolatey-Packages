$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = 'svn'
  fileType      = 'msi'
  url           = 'https://sourceforge.net/projects/win32svn/files/1.8.17/Setup-Subversion-1.8.17.msi'
  silentArgs    = '/quiet'
  validExitCodes= @(0)
  softwareName  = 'Subversion*'
  checksum      = 'ccebf8e28204ea27f95ad7de4ffeefea03afc3e2b5d6123e8b8f7383d173858f'
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs

$installDir = (Get-ItemProperty 'HKCU:\Software\Microsoft\Windows\CurrentVersion\App Paths\svn.exe').Path
Install-ChocolateyPath $installDir
