Import-Module au;
Import-Module '../../_scripts/Get-GitHubRelease.psm1';

$owner = 'rustdesk';
$repository = 'rustdesk';

function global:au_SearchReplace {
    @{
        'rustdesk.nuspec' = @{
            '(^\s*<dependency id="rustdesk.install" version=")(\[.*\])(" />)' = "`$1[$($Latest.Version)]`$3"
        }
    }
}

function global:au_GetLatest {
    $release = Get-GitHubRelease -Owner:$owner -Name:$repository;
    [regex]$re = '/rustdesk/rustdesk/releases/download/(\d+(?:\.\d+)+)/.+-windows_x64\.zip';
    $url = $release.assets.browser_download_url | Where-Object { $_ -match $re } | Select-Object -First 1;
    $version = $matches[1];

    return @{ 
        Version = $version 
    };
}

update
