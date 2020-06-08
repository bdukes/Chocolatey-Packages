$packageArgs = @{
  packageName    = 'imagemagick.app'
  installerType  = 'exe'
  url            = 'https://imagemagick.org/download/binaries/ImageMagick-7.0.10-17-Q16-x86-dll.exe'
  url64          = 'https://imagemagick.org/download/binaries/ImageMagick-7.0.10-17-Q16-x64-dll.exe'
  fallbackUrl    = 'https://ftp.icm.edu.pl/pub/graphics/ImageMagick/binaries/ImageMagick-7.0.10-17-Q16-x86-dll.exe'
  fallbackUrl64  = 'https://ftp.icm.edu.pl/pub/graphics/ImageMagick/binaries/ImageMagick-7.0.10-17-Q16-x64-dll.exe'
  checksum       = 'a2ae611e84bfa6d35d382bb692629e81227dfb7dbda0204af090aabf19327a86'
  checksum64     = 'e92eb165a01e37574f3a153828ceb6fa06cdd6e90013f205280ce4d276a2ea26'
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
