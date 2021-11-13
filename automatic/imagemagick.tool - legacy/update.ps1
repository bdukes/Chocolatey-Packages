import-module au

function global:au_SearchReplace {
    @{
        '.\legal\VERIFICATION.txt' = @{
            "(?i)(\s+x32:).*"     = "`${1} $($Latest.URL32)"
            "(?i)(\s+x64:).*"     = "`${1} $($Latest.URL64)"
            "(?i)(checksum32:).*" = "`${1} $($Latest.Checksum32)"
            "(?i)(checksum64:).*" = "`${1} $($Latest.Checksum64)"
        }
    }
}

function global:au_BeforeUpdate {
    Get-RemoteFiles -Purge
}

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri 'https://legacy.imagemagick.org/script/download.php'

    $re32 = "^http.+ImageMagick-(\d+\.\d+\.\d+(?:-\d+)?)-portable-Q16-x86\.zip$"
    $re64 = "^http.+ImageMagick-(\d+\.\d+\.\d+(?:-\d+)?)-portable-Q16-x64\.zip$"
    $reFullVersion = "^http.+ImageMagick-(\d+\.\d+\.\d+-\d+)[a-zA-Z0-9-]*\.exe$"
    $url32 = $download_page.links | Where-Object href -match $re32 | Select-Object -First 1 -expand href
    $url64 = $download_page.links | Where-Object href -match $re64 | Select-Object -First 1 -expand href
    $versionUrl = $download_page.links | Where-Object href -match $reFullVersion | Select-Object -First 1 -expand href

    if ($versionUrl) {
        $versionMatch = $versionUrl | select-string -Pattern $reFullVersion
    } else {
        $versionMatch = $url64 | select-string -Pattern $re64
    }

    $version = $versionMatch.Matches[0].Groups[1].Value -replace '-', '.'
    return @{
        URL32       = $url32
        URL64       = $url64
        Version     = $version
        PackageName = 'imagemagick.tool'
    }
}

update -ChecksumFor none;
