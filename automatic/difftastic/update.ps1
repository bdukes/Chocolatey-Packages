import-module Chocolatey-AU;;
Import-Module '../../_scripts/Get-GitHubRelease.psm1';

$owner = 'Wilfred';
$repository = 'difftastic';

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
    $release = Get-GitHubRelease -Owner:$owner -Name:$repository;
    [regex]$re = '/Wilfred/difftastic/releases/download/(\d+(?:\.\d+)+)/difft-x86_64-pc-windows-msvc\.zip';
    $url = $release.assets.browser_download_url | Where-Object { $_ -match $re } | Select-Object -First 1;
    $version = $matches[1];

    return @{
        URL64   = $url;
        Version = $version;
    };
}

update
