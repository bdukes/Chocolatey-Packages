Import-Module au;

function global:au_SearchReplace {
    @{
        'tools\chocolateyInstall.ps1' = @{
            "(^\s*checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
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
        URL32   = 'https://www.linqpad.net/GetFile.aspx?LINQPad6.zip';
        Version = $version;
    }
}

update
