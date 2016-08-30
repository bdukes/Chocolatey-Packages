import-module au

$releases = 'https://www.imagemagick.org/script/binary-releases.php'

function global:au_SearchReplace {
    @{
        'tools\chocolateyInstall.ps1' = @{
            "(^[$]url64\s*=\s*)('.*')"      = "`$1'$($Latest.URL64)'"
            "(^[$]url\s*=\s*)('.*')"        = "`$1'$($Latest.URL32)'"
            "(^[$]checksum\s*=\s*)('.*')"   = "`$1'$($Latest.Checksum32)'"
            "(^[$]checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
        }
     }
}

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases

    $re  = "^http.+ImageMagick-(\d+\.\d+\.\d+-\d+)-Q16-x(?:86|64)-dll.exe$"
    $url = $download_page.links | ? href -match $re | select -First 2 -expand href

    $versionMatch = $url[0] | select-string -Pattern $re
    $version = $versionMatch.Matches[0].Groups[1].Value -replace '-', '.'

    $Latest = @{ URL32 = $url[1]; URL64 = $url[0]; Version = $version }
    return $Latest
}

update
