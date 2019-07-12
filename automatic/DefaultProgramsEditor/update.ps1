import-module au

function global:au_SearchReplace {
    @{
        'tools\chocolateyInstall.ps1' = @{
            "(^\s*checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
        }
    }
}

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri 'https://defaultprogramseditor.com/'

    $linkText = $download_page.links | ? innerText -match 'Version (?:\d+\.)+\d+' | select -First 1 -expand innerText
    $versionMatch = $linkText | select-string -Pattern '(?:\d+\.)+\d+'
    $version = $versionMatch.Matches[0].Value

    return @{ URL32 = 'https://defaultprogramseditor.com/download'; Version = $version }
}

update
