import-module au

$releases = 'https://www.imagemagick.org/script/binary-releases.php'

function global:au_SearchReplace {
    @{
        'tools\chocolateyInstall.ps1' = @{
            "(^\s*url64\s*=\s*)('.*')"      = "`$1'$($Latest.URL64)'"
            "(^\s*url\s*=\s*)('.*')"        = "`$1'$($Latest.URL32)'"
            "(^\s*checksum\s*=\s*)('.*')"   = "`$1'$($Latest.Checksum32)'"
            "(^\s*checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
        }
     }
}

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases

    $re  = "^http.+ImageMagick-(\d+\.\d+\.\d+-\d+)-Q16-x(?:86|64)-dll.exe$"
    $url = $download_page.links | ? href -match $re | select -First 2 -expand href

    $versionMatch = $url[0] | select-string -Pattern $re
    $version = $versionMatch.Matches[0].Groups[1].Value -replace '-', '.'
    $url64 = $url[0] -replace 'http://', 'https://'
    $url32 = $url[1] -replace 'http://', 'https://'

    $Latest = @{ URL32 = $url32; URL64 = $url64; Version = $version }
    return $Latest
}

update
