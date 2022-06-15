import-module au

function global:au_SearchReplace {
    @{
        'tools\chocolateyInstall.ps1' = @{
            "(^\s*url\s*=\s*)('.*')"            = "`$1'$($Latest.URL32)'"
            "(^\s*url64bit\s*=\s*)('.*')"       = "`$1'$($Latest.URL64)'"
            "(^\s*checksum\s*=\s*)('.*')"       = "`$1'$($Latest.Checksum32)'"
            "(^\s*checksumType\s*=\s*)('.*')"   = "`$1'$($Latest.ChecksumType32)'"
            "(^\s*checksum64\s*=\s*)('.*')"     = "`$1'$($Latest.Checksum64)'"
            "(^\s*checksumType64\s*=\s*)('.*')" = "`$1'$($Latest.ChecksumType64)'"
        }
    }
}

function global:au_GetLatest {
    $download_url = [System.Uri]'https://github.com/rustdesk/rustdesk/releases/latest'
    $download_page = Invoke-WebRequest -Uri $download_url -UseBasicParsing

    [regex]$re32 = '/rustdesk/rustdesk/releases/download/(\d+(?:\.\d+)+)/.+-windows_x32\.zip'
    [regex]$re64 = '/rustdesk/rustdesk/releases/download/(\d+(?:\.\d+)+)/.+-windows_x64\.zip'
    if ($download_page.Content -match $re32) {
        $url32 = $matches[0];
        $version = $matches[1];
        $uri32 = New-Object System.Uri @($download_url, $url32)
    }
    if ($download_page.Content -match $re64) {
        $url64 = $matches[0];
        $version = $matches[1];
        $uri64 = New-Object System.Uri @($download_url, $url64)
    }

    return @{
        URL32   = $uri32.AbsoluteUri;
        URL64   = $uri64.AbsoluteUri;
        Version = $version;
    };
}

update
