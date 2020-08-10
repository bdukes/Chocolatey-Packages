$packageArgs = @{
  packageName    = 'imagemagick.app'
  installerType  = 'exe'
  url            = 'https://imagemagick.org/download/binaries/ImageMagick-7.0.10-26-Q16-x86-dll.exe'
  url64          = 'https://imagemagick.org/download/binaries/ImageMagick-7.0.10-26-Q16-HDRI-x64-dll.exe'
  fallbackUrl    = 'https://ftp.icm.edu.pl/pub/graphics/ImageMagick/binaries/ImageMagick-7.0.10-26-Q16-x86-dll.exe'
  fallbackUrl64  = 'https://ftp.icm.edu.pl/pub/graphics/ImageMagick/binaries/ImageMagick-7.0.10-26-Q16-HDRI-x64-dll.exe'
  checksum       = '2deb18ca091d08078968f7f56e2e1913aecac38b3cf235c4665933cbc1af8cd7'
  checksum64     = 'dd8d132b912aaff5caf05dc4aba2ee3233207446bf8dbbaed534b9a588a3feaf'
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
    $additionalTasks = @()
    if ($packageParams.InstallDevelopmentHeaders) {
        $additionalTasks += 'install_devel'
    }
    if ($packageParams.LegacySupport) {
        $additionalTasks += 'legacy_support'
    }

    if ($additionalTasks.length -gt 0) {
        $packageArgs.silentArgs = $packageArgs.silentArgs + ' /MERGETASKS=' + ($additionalTasks -join ',')
    }
}

try {
    # Uninstall older version of imagemagick, otherwise the installation wonâ€™t be silent.
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
