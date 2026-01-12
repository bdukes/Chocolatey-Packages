import-module Chocolatey-AU;

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
    $download_page = Invoke-WebRequest -Uri 'https://legacy.imagemagick.org/script/download.php' -UseBasicParsing;

    $url32 = $download_page | Select-String -Pattern 'http.+?ImageMagick-(\d+\.\d+\.\d+(?:-\d+)?)-portable-Q16-x86\.7z';
    $url64 = $download_page | Select-String -Pattern 'http.+?ImageMagick-(\d+\.\d+\.\d+(?:-\d+)?)-portable-Q16-x64\.7z';
    $versionUrl = $download_page | Select-String -Pattern 'http.+?ImageMagick-(\d+\.\d+\.\d+-\d+)[a-zA-Z0-9-]*?\.exe';

    if ($versionUrl) {
        $versionMatch = $versionUrl;
    }
    else {
        $versionMatch = $url64;
    }

    $version = $versionMatch.Matches[0].Groups[1].Value -replace '-', '.';
    return @{
        URL32       = $url32.Matches[0].Value
        URL64       = $url64.Matches[0].Value
        Version     = $version + '00'
        PackageName = 'imagemagick.tool'
    }
}

update -ChecksumFor none;
