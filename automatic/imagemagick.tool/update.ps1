import-module au

function global:au_SearchReplace {
    @{
        'tools\chocolateyInstall.ps1' = @{
            "(^\s*url64\s*=\s*)('.*')"         = "`$1'$($Latest.URL64)'"
            "(^\s*url\s*=\s*)('.*')"           = "`$1'$($Latest.URL32)'"
            "(^\s*fallbackUrl64\s*=\s*)('.*')" = "`$1'$($Latest.FallbackUrl64)'"
            "(^\s*fallbackUrl\s*=\s*)('.*')"   = "`$1'$($Latest.FallbackUrl32)'"
            "(^\s*checksum\s*=\s*)('.*')"      = "`$1'$($Latest.Checksum32)'"
            "(^\s*checksum64\s*=\s*)('.*')"    = "`$1'$($Latest.Checksum64)'"
        }
     }
}

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri 'https://www.imagemagick.org/script/download.php'

    $re32 = "^http.+ImageMagick-(\d+\.\d+\.\d+-\d+)-portable-Q16-x86.zip$"
    $re64 = "^http.+ImageMagick-(\d+\.\d+\.\d+-\d+)-portable-Q16-x64.zip$"
    $url32 = $download_page.links | ? href -match $re32 | select -First 1 -expand href
    $url64 = $download_page.links | ? href -match $re64 | select -First 1 -expand href
    $fallbackUrl32 =  $url32 -replace 'https?://(?:www\.|download\.)?imagemagick.org/(ImageMagick/)?download/binaries/', 'https://ftp.icm.edu.pl/pub/graphics/ImageMagick/binaries/'
    $fallbackUrl64 =  $url64 -replace 'https?://(?:www\.|download\.)?imagemagick.org/(ImageMagick/)?download/binaries/', 'https://ftp.icm.edu.pl/pub/graphics/ImageMagick/binaries/'

    $versionMatch = $url64 | select-string -Pattern $re64
    $version = $versionMatch.Matches[0].Groups[1].Value -replace '-', '.'

    return @{
        URL32 = $url32
        URL64 = $url64
        Version = $version
        FallbackUrl32 = $fallbackUrl32
        FallbackUrl64 = $fallbackUrl64
    }
}

update
