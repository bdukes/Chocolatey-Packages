import-module Chocolatey-AU;;
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
    [regex]$re = '/rustdesk/rustdesk/releases/download/(\d+(?:\.\d+)+(?:-\d+)?)/.+-x86_64\.exe';
    $url = $release.assets.browser_download_url | Where-Object { $_ -match $re } | Select-Object -First 1;
    $version = $matches[1];
    $version = $version -replace '-', '.';

    return @{ 
        Version = $version 
    };
}

update
