import-module au

function global:au_SearchReplace {
    @{
        'tools\chocolateyInstall.ps1' = @{
            "(^\s*checksum\s*=\s*)('.*')"   = "`$1'$($Latest.Checksum32)'"
        }
     }
}

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri 'https://www.linqpad.net/Download.aspx'

    $re = "GetFile\.aspx\?preview\+LINQPad5-AnyCPU\.zip$"
    $linkText = $download_page.links | ? href -match $re | select -First 1 -expand innerText

    $versionMatch = $linkText | select-string -Pattern '(?:\d+\.)+\d+'
    $version = $versionMatch.Matches[0].Value

    return @{
        URL32 = 'https://www.linqpad.net/GetFile.aspx?preview+LINQPad5-AnyCPU.zip';
        Version = "$version-beta"
        PackageName = 'linqpad5.AnyCPU.portable'
    }
}

update
