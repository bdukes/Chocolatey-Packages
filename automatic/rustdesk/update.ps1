import-module au

function global:au_SearchReplace {
    @{
        'rustdesk.nuspec' = @{
            '(^\s*<dependency id="rustdesk.install" version=")(\[.*\])(" />)' = "`$1[$($Latest.Version)]`$3"
        }
    }
}

function global:au_GetLatest {
    $download_url = [System.Uri]'https://github.com/rustdesk/rustdesk/releases/latest'
    $download_page = Invoke-WebRequest -Uri $download_url -UseBasicParsing

    [regex]$re64 = '/rustdesk/rustdesk/releases/download/(\d+(?:\.\d+)+)/.+-windows_x64\.zip'
    if ($download_page.Content -match $re64) {
        return @{
            Version = $matches[1];
        };
    }

    return @{ };
}

update
