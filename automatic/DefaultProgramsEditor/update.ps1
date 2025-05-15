import-module Chocolatey-AU;

function global:au_SearchReplace {
    @{
        'tools\chocolateyInstall.ps1' = @{
            "(^\s*checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
        }
    }
}

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri 'https://defaultprogramseditor.com/' -UseBasicParsing;

    $versionMatch = $download_page | select-string -Pattern '(?:\d+\.)+\d+'
    $version = $versionMatch.Matches[0].Value

    return @{ 
        URL32   = 'https://defaultprogramseditor.com/download'; 
        Version = $version;
    }
}

update
