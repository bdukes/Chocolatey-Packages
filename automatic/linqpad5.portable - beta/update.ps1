import-module au

function global:au_SearchReplace {
    @{
        'tools\chocolateyInstall.ps1' = @{
            "(^\s*checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
        }
    }
}

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri 'https://www.linqpad.net/LINQPad5.aspx'

    $re = "GetFile\.aspx\?preview\+LINQPad5\.zip$"
    $linkText = $download_page.links | ? href -match $re | select -First 1 -expand outerHTML

    $versionMatch = $linkText | select-string -Pattern '(?:\d+\.)+\d+'
    if ($versionMatch) {
        $version = $versionMatch.Matches[0].Value
    } else {
        $version = '0.0.0'
    }

    return @{
        URL32       = 'https://www.linqpad.net/GetFile.aspx?preview+LINQPad5.zip'
        Version     = "$version-beta"
        PackageName = 'linqpad5.portable'
    }
}

update
