Import-Module au;
Import-Module '../../_scripts/Get-GitHubRelease.psm1';

$owner = 'rustdesk';
$repository = 'rustdesk';

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
    $release = Get-GitHubRelease -Owner:$owner -Name:$repository;
    [regex]$re32 = '/rustdesk/rustdesk/releases/download/(\d+(?:\.\d+)+)/.+-windows_x32\.zip';
    [regex]$re64 = '/rustdesk/rustdesk/releases/download/(\d+(?:\.\d+)+)/.+-windows_x64\.zip';
    $url32 = $release.assets.browser_download_url | Where-Object { $_ -match $re32 } | Select-Object -First 1;
    $url64 = $release.assets.browser_download_url | Where-Object { $_ -match $re64 } | Select-Object -First 1;
    $version = $matches[1];

    return @{
        URL32   = $url32;
        URL64   = $url64;
        Version = $version;
    };
}

update
