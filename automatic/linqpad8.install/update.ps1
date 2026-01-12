import-module Chocolatey-AU;

function global:au_SearchReplace {
    @{
        'tools\chocolateyInstall.ps1' = @{
            "(^\s*checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
        }
    }
}

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri 'https://www.linqpad.net/Download.aspx' -UseBasicParsing;

    $versionMatches = $download_page | select-string -Pattern '<td[^>]*>\s*(?:<[^>]+>)*(8\.(?:\d+\.?)+)</';
    $versionMatch = $versionMatches.Matches[0];
    $version = $versionMatch.Groups[1].Value;

    $Latest = @{ URL32 = 'https://www.linqpad.net/GetFile.aspx?LINQPad8Setup.exe'; Version = $version }
    return $Latest
}

update
