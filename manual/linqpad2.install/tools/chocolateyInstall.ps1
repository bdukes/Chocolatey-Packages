$ErrorActionPreference = 'Stop';

$packageName = 'linqpad2.install'
$url = 'https://www.linqpad.net/GetFile.aspx?LINQPadSetup.exe'

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'exe'
  url            = $url
  softwareName   = 'linqpad*'
  checksum       = '0B407603106679BC128292D3410E3F00C5F16FD72D928414D12C1142FC853979'
  checksumType   = 'sha256'
  silentArgs     = "/silent"
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
