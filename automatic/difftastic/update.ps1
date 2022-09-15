import-module au

function global:au_SearchReplace {
    @{
        'tools\chocolateyInstall.ps1' = @{
            "(^\s*url\s*=\s*)('.*')"          = "`$1'$($Latest.URL64)'"
            "(^\s*checksum\s*=\s*)('.*')"     = "`$1'$($Latest.Checksum64)'"
            "(^\s*checksumType\s*=\s*)('.*')" = "`$1'$($Latest.ChecksumType64)'"
        }
    }
}

function global:au_GetLatest {
    $download_url = [System.Uri]'https://github.com/Wilfred/difftastic/releases/latest'
    $download_page = Invoke-WebRequest -Uri $download_url -UseBasicParsing

    [regex]$re = '/Wilfred/difftastic/releases/download/(\d+(?:\.\d+)+)/difft-x86_64-pc-windows-msvc\.zip'
    if ($download_page.Content -match $re) {
        $url = $matches[0];
        $version = $matches[1];
        $uri = New-Object System.Uri @($download_url, $url)
    }

    return @{
        URL64   = $uri.AbsoluteUri;
        Version = $version;
    };
}

update
