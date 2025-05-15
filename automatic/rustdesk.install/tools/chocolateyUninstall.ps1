$ErrorActionPreference = 'Stop';

$installedPath = 'C:\Program Files\RustDesk\rustdesk.exe';
if (Test-Path $installedPath) {
  & $installedPath --uninstall;
}
