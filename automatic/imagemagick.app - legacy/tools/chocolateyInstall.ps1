$packageArgs = @{
  packageName    = 'imagemagick.app'
  installerType  = 'exe'
  url            = 'https://imagemagick.org/download/binaries/ImageMagick-6.9.11-32-Q16-x86-dll.exe'
  url64          = 'https://imagemagick.org/download/binaries/ImageMagick-6.9.11-32-Q16-x64-dll.exe'
  fallbackUrl    = 'https://ftp.icm.edu.pl/pub/graphics/ImageMagick/binaries/ImageMagick-6.9.11-32-Q16-x86-dll.exe'
  fallbackUrl64  = 'https://ftp.icm.edu.pl/pub/graphics/ImageMagick/binaries/ImageMagick-6.9.11-32-Q16-x64-dll.exe'
  checksum       = '93dc7e3d9f9f1bbe35f9e6a6aff5ee671064519e8d330ae09b864a233a13bf53'
  checksum64     = '195ff4709878257915c3a0ba8fe8803c9027391348ac6809c36415c8d83b5407'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  silentArgs     = '/VERYSILENT'
  validExitCodes = @(0)
}

try {
    Get-WebHeaders $packageArgs.url
}
catch {
    $packageArgs.url = $packageArgs.fallbackUrl
    $packageArgs.url64 = $packageArgs.fallbackUrl64
}

if ($env:chocolateyPackageParameters) {
    $packageParams = ConvertFrom-StringData $env:chocolateyPackageParameters.Replace(" ", "`n")
    if ($packageParams.InstallDevelopmentHeaders) {
        $packageArgs.silentArgs = $packageArgs.silentArgs + ' /MERGETASKS=install_devel'
    }
}

try {
    # Uninstall older version of imagemagick, otherwise the installation won’t be silent.
    $regPath = 'HKLM:\SOFTWARE\ImageMagick\Current'
    if ($env:chocolateyForceX86) {
        $regPath = 'HKLM:\SOFTWARE\Wow6432Node\ImageMagick\Current'
    }
    if (Test-Path $regPath) {
        $uninstallPath = (Get-ItemProperty -Path $regPath).BinPath
        $uninstallFilePath = "$uninstallPath\unins000.exe"
        Uninstall-ChocolateyPackage $packageArgs.packageName $packageArgs.installerType $packageArgs.silentArgs $uninstallFilePath
    }
} catch {
    Write-Warning "$packageName uninstallation failed, with message $($_.Exception.Message)"
    Write-Warning "$packageName installation may not be silent"
}

Write-Verbose "Installing with arguments: $($packageArgs.silentArgs)"
Install-ChocolateyPackage @packageArgs
