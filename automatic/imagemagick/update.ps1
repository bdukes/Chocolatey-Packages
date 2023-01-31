import-module au

function global:au_SearchReplace {
    @{
        'imagemagick.nuspec' = @{
            '(^\s*<dependency id="imagemagick.app" version=")(\[.*\])(" />)' = "`$1[$($Latest.Version)]`$3"
        }
    }
}

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri 'https://www.imagemagick.org/script/download.php'

    $re32 = "^http.+ImageMagick-(\d+\.\d+\.\d+-\d+)-Q16-x86-dll.exe$"
    $re64 = "^http.+ImageMagick-(\d+\.\d+\.\d+-\d+)-Q16-HDRI-x64-dll.exe$"
    $url32 = $download_page.links | ? href -match $re32 | select -First 1 -expand href
    $url64 = $download_page.links | ? href -match $re64 | select -First 1 -expand href

    $versionMatch = $url64 | select-string -Pattern $re64
    $version = $versionMatch.Matches[0].Groups[1].Value -replace '-', '.'

    $Latest = @{ 
        URL32   = $url32; 
        URL64   = $url64; 
        Version = $version + '00'
    }
    return $Latest
}

update
