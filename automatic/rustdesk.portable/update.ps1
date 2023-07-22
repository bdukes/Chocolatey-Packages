Import-Module au;
Import-Module "$PSScriptRoot/../../_scripts/Get-GitHubRelease.psm1";

$owner = 'rustdesk';
$repository = 'rustdesk';

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
    $release = Get-GitHubRelease -Owner:$owner -Name:$repository;
    [regex]$re = '/rustdesk/rustdesk/releases/download/(\d+(?:\.\d+)+)/.+-x86_64\.exe';
    $url = $release.assets.browser_download_url | Where-Object { $_ -match $re } | Select-Object -First 1;
    $version = $matches[1];

    return @{
        URL     = $url;
        Version = $version;
    };
}

Update-Package;
