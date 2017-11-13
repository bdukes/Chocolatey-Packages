
$ErrorActionPreference = 'Stop';


$packageName = 'spacesniffer'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'http://www.uderzo.it/main_products/space_sniffer/files/spacesniffer_1_3_0_2.zip'

$packageArgs = @{
    packageName   = $packageName
    unzipLocation = $toolsDir
    url           = $url
    checksum      = '156C45CB53A283D0B919CA8B1E0FAF3B967C896B8A580B962E493A27C7F465C2'
    checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
