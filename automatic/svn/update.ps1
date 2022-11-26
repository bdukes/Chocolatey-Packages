import-module au

function global:au_SearchReplace {
    @{
        'tools\chocolateyInstall.ps1' = @{
            "(^\s*url\s*=\s*)('.*')"          = "`$1'$($Latest.URL)'"
            "(^\s*checksum\s*=\s*)('.*')"     = "`$1'$($Latest.Checksum32)'"
            "(^\s*checksumType\s*=\s*)('.*')" = "`$1'$($Latest.ChecksumType32)'"
        }
    }
}

function global:au_GetLatest {
    $homePageUri = [System.Uri]'https://alagazam.net/'
    $homePage = Invoke-WebRequest -Uri $homePageUri
    $downloadUri = New-Object System.Uri @($homePageUri, $homePage.ParsedHTML.all['iframe_version'].src)
    $downloadPage = Invoke-WebRequest -Uri $downloadUri

    $re = '^http.+Setup-Subversion-(\d+\.\d+\.\d+).msi$'

    $url = $downloadPage.links | Where-Object href -match $re | Select-Object -First 1 -Expand href

    $versionMatch = $url | select-string -Pattern $re
    $version = $versionMatch.Matches[0].Groups[1].Value

    $Latest = @{ URL = $url; Version = $version }
    return $Latest
}

update
