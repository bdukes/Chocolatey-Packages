$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = 'svn'
  fileType      = 'msi'
  url           = 'https://sourceforge.net/projects/win32svn/files/1.8.15/Setup-Subversion-1.8.15.msi'
  silentArgs    = '/quiet'
  validExitCodes= @(0)
  softwareName  = 'Subversion*'
  checksum      = ''
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs

$installDir = (Get-ItemProperty 'HKCU:\Software\Microsoft\Windows\CurrentVersion\App Paths\svn.exe').Path
Install-ChocolateyPath $installDir
