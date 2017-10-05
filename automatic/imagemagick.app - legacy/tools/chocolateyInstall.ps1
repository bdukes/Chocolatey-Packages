$packageArgs = @{
  packageName    = 'imagemagick.app'
  installerType  = 'exe'
  url            = 'https://www.imagemagick.org/download/binaries/ImageMagick-6.9.9-18-Q16-x86-dll.exe'
  url64          = 'https://www.imagemagick.org/download/binaries/ImageMagick-6.9.9-18-Q16-x64-dll.exe'
  checksum       = '14a58864b8a3f2624e3e2376f2fdfba399ba2f1ad344966f6ead8cd74e99a761'
  checksum64     = 'c2c9e42f877db5e24df726d368ed25dd27d0a76d0bc6970412589a7c8bde4e73'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  silentArgs     = '/VERYSILENT'
  validExitCodes = @(0)
}

try {
    Get-WebHeaders $packageArgs.url
}
catch {
    $packageArgs.url = $packageArgs.url -replace 'https://www.imagemagick.org/download/binaries/', 'http://ftp.icm.edu.pl/pub/graphics/ImageMagick/binaries/'
    $packageArgs.url64 = $packageArgs.url64 -replace 'https://www.imagemagick.org/download/binaries/', 'http://ftp.icm.edu.pl/pub/graphics/ImageMagick/binaries/'
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
