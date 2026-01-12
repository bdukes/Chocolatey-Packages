import-module Chocolatey-AU;

function global:au_SearchReplace {
    @{
        'linqpad8.nuspec' = @{
            '(^\s*<dependency id="linqpad8.install" version=")(\[.*\])(" />)' = "`$1[$($Latest.Version)]`$3"
        }
    }
}

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri 'https://www.linqpad.net/Download.aspx' -UseBasicParsing;

    $versionMatches = $download_page | select-string -Pattern '<td[^>]*>\s*(?:<[^>]+>)*(8\.(?:\d+\.?)+)</';
    $versionMatch = $versionMatches.Matches[0];
    $version = $versionMatch.Groups[1].Value;

    $Latest = @{ Version = $version }
    return $Latest
}

update
