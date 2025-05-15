import-module Chocolatey-AU;;

function global:au_SearchReplace {
    @{
        'linqpad6.nuspec' = @{
            '(^\s*<dependency id="linqpad6.install" version=")(\[.*\])(" />)' = "`$1[$($Latest.Version)]`$3"
        }
    }
}

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri 'https://www.linqpad.net/LINQPad6.aspx' -UseBasicParsing;

    $re = '<h3>(6\.(?:\d+\.?)+) Release Notes</h3>';

    $versionMatches = $download_page | select-string -Pattern $re;
    $versionMatch = $versionMatches.Matches[0];
    $version = $versionMatch.Groups[1].Value;

    return @{ 
        Version = $version; 
    };
}

update
