import-module au

function global:au_SearchReplace {
    @{
        'linqpad5.nuspec' = @{
            '(^\s*<dependency id="linqpad5.install" version=")(\[.*\])(" />)' = "`$1[$($Latest.Version)]`$3"
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

    $Latest = @{ Version = $version }
    return $Latest
}

update
