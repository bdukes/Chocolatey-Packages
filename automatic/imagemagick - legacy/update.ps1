import-module Chocolatey-AU;

function global:au_SearchReplace {
    @{
        'imagemagick - legacy.nuspec' = @{
            '(^\s*<dependency id="imagemagick.app" version=")(\[.*\])(" />)' = "`$1[$($Latest.Version)]`$3"
        }
    }
}

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri 'https://legacy.imagemagick.org/script/download.php' -UseBasicParsing;

    $url32 = $download_page | Select-String 'http.+ImageMagick-(\d+\.\d+\.\d+-\d+)-Q16-x86-dll.exe';
    $url64 = $download_page | Select-String 'http.+ImageMagick-(\d+\.\d+\.\d+-\d+)-Q16-x64-dll.exe';

    $versionMatch = $url64 | select-string -Pattern $re64;
    $version = $versionMatch.Matches[0].Groups[1].Value -replace '-', '.';

    return @{
        URL32       = $url32
        URL64       = $url64
        Version     = $version + '00'
        PackageName = 'imagemagick'
    }
}

update
