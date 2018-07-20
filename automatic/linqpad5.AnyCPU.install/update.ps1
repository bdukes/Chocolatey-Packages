import-module au

function global:au_SearchReplace {
    @{
        'tools\chocolateyInstall.ps1' = @{
            "(^\s*checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
        }
    }
}

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri 'https://www.linqpad.net/Download.aspx'

    $re = 'Current release versions?:\s*<b>\s*([\d.]+)\s*</b>(?:\s*/\s*<b>\s*([\d.]+)\s*</b>)?'

    $versionMatches = $download_page | select-string -Pattern $re
    $versionMatch = $versionMatches.Matches[0]
    $version = $versionMatch.Groups[1].Value
    if (($version -notlike '5*') -and ($versionMatch.Groups[2].Value -like '5*')) {
        $version = $versionMatch.Groups[2].Value
    }

    $Latest = @{ URL32 = 'https://www.linqpad.net/GetFile.aspx?LINQPad5Setup-AnyCPU.exe'; Version = $version }
    return $Latest
}

update
