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

    $url32 = $download_page | Select-String -Pattern 'http.+?ImageMagick-(\d+\.\d+\.\d+-\d+)-Q16-x86-dll.exe';
    $url64 = $download_page | Select-String -Pattern 'http.+?ImageMagick-(\d+\.\d+\.\d+-\d+)-Q16-x64-dll.exe';

    $version = $url64.Matches[0].Groups[1].Value -replace '-', '.';

    return @{
        URL32       = $url32.Matches[0].Value
        URL64       = $url64.Matches[0].Value
        Version     = $version + '00'
        PackageName = 'imagemagick'
    }
}

update
