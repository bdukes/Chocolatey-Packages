import-module au;

function global:au_SearchReplace {
    @{
        'tools\chocolateyInstall.ps1' = @{
            "(^\s*url\s*=\s*)('.*')"          = "`$1'$($Latest.URL32)'"
            "(^\s*url64\s*=\s*)('.*')"        = "`$1'$($Latest.URL64)'"
            "(^\s*checksum\s*=\s*)('.*')"     = "`$1'$($Latest.Checksum32)'"
            "(^\s*checksum64\s*=\s*)('.*')"   = "`$1'$($Latest.Checksum64)'"
        }
     }
}

function global:au_GetLatest {
    $releases = 'https://lastpass.com/download';
    $downloadPage = Invoke-WebRequest -Uri $releases;

    $downloadCard = $downloadPage.AllElements |
                    ? class -match 'card-dl' |
                    ? innerHTML -match 'universal-windows-installer';

    $version = $downloadCard |
               Select-String -Pattern 'Version (\d+\.\d+\.\d+)' |
               % { $_.Matches[0].Groups[1].Value };

    $url32 = $downloadCard |
             Select-String -Pattern "href=['`"]([^'`"]+)['`"]" |
             % { $_.Matches[0].Groups[1].Value };

    $url64 = $url32 -replace 'lastpass\.exe$','lastpass_x64.exe';

    $Latest = @{ URL32 = $url32; URL64 = $url64; Version = $version };
    return $Latest;
}

update;
