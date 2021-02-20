import-module au

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
    $download_list = Invoke-WebRequest -Uri 'https://www.mercurial-scm.org/sources.js';

    $re  = 'https.+/windows/Mercurial-(\d+\.\d+(?:\.\d+)?)(?:-x86|-x64)\.exe';
    $urls = $download_list.Content.Split("`n") |
                Where-Object { $_ -match $re } |
                Select-String -Pattern $re |
                ForEach-Object { $_.Matches[0].Groups[0].Value };

    $versionMatch = $urls[0] | Select-String -Pattern $re;
    $version = $versionMatch.Matches[0].Groups[1].Value;
    $url32 = $urls[0];
    $url64 = $urls[1];

    $Latest = @{ URL32 = $url32; URL64 = $url64; Version = $version };
    return $Latest;
}

update
