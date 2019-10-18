import-module au

function global:au_SearchReplace {
    @{
        'tools\chocolateyInstall.ps1' = @{
            "(^\s*checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
        }
    }
}

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri 'https://www.linqpad.net/LINQPad6.aspx'

    $betaCard = $download_page.AllElements | ? class -match 'cardnarrow' | ? innerHtml -match 'beta'

    $versionMatch = $betaCard | Select-String -Pattern 'Version ((?:\d+\.)+\d+)'
    if ($versionMatch) {
        $version = $versionMatch.Matches[0].Groups[1].Value
    } else {
        $version = '0.0.0'
    }

    return @{
        URL32       = 'https://www.linqpad.net/GetFile.aspx?preview+LINQPad6-Beta.zip'
        Version     = "$version-beta"
        PackageName = 'linqpad6.portable'
    }
}

update
