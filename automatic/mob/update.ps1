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
    $download_url = [System.Uri]'https://github.com/remotemobprogramming/mob/releases/latest'
    $download_page = Invoke-WebRequest -Uri $download_url -UseBasicParsing

    [regex]$re = '/remotemobprogramming/mob/releases/download/v(\d+(?:\.\d+)+)/.+_windows_amd64\.tar\.gz'
    if ($download_page.Content -match $re) {
        $url = $matches[0];
        $version = $matches[1];
        $uri = New-Object System.Uri @($download_url, $url)
        return @{ URL = $uri.AbsoluteUri; Version = $version };
    }

    return @{};
}

update
