import-module au

$releases = 'https://lastpass.com/download'

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
    $download_page = Invoke-WebRequest -Uri $releases

    $re = "Version (\d+\.\d+\.\d+)"
    $version = $download_page.AllElements |
                    ? class -match 'card-dl' |
                    ? innerHTML -match 'applications' |
                    Select-String $re |
                    % { $_.Matches[0].Groups[1].Value }

    $url32 = 'https://lastpass.com/download/cdn/lastappinstall.exe'
    $url64 = 'https://lastpass.com/download/cdn/lastappinstall_x64.exe'

    $Latest = @{ URL32 = $url32; URL64 = $url64; Version = $version }
    return $Latest
}

update
