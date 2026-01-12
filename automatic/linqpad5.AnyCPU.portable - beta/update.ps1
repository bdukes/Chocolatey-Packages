import-module Chocolatey-AU;

function global:au_SearchReplace {
    @{
        'tools\chocolateyInstall.ps1' = @{
            "(^\s*checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
        }
    }
}

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri 'https://www.linqpad.net/LINQPad5.aspx' -UseBasicParsing;

    $versionMatch = $download_page | select-string -Pattern 'GetFile\.aspx\?preview\+LINQPad5-AnyCPU\.zip">[^<]*(?:\d+\.)+\d+';
    if ($versionMatch) {
        $version = $versionMatch.Matches[0].Value;
    } else {
        $version = '0.0.0';
    }

    return @{
        URL32       = 'https://www.linqpad.net/GetFile.aspx?preview+LINQPad5-AnyCPU.zip';
        Version     = "$version-beta"
        PackageName = 'linqpad5.AnyCPU.portable'
    }
}

update
