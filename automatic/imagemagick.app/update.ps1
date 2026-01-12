import-module Chocolatey-AU;

function global:au_SearchReplace {
    @{        
        ".\legal\VERIFICATION.txt" = @{
            "(?i)(\s+x32:).*"     = "`${1} $($Latest.URL32)"
            "(?i)(\s+x64:).*"     = "`${1} $($Latest.URL64)"
            "(?i)(checksum32:).*" = "`${1} $($Latest.Checksum32)"
            "(?i)(checksum64:).*" = "`${1} $($Latest.Checksum64)"
        }
    }
}

function global:au_BeforeUpdate {
    Get-RemoteFiles -Purge
}

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri 'https://imagemagick.org/script/download.php' -UseBasicParsing;

    $url32 = $download_page | Select-String -Pattern 'http.+ImageMagick-(\d+\.\d+\.\d+-\d+)-Q16-x86-dll.exe';
    $url64 = $download_page | Select-String -Pattern 'http.+ImageMagick-(\d+\.\d+\.\d+-\d+)-Q16-HDRI-x64-dll.exe';

    $version = $url64.Matches[0].Groups[1].Value -replace '-', '.';

    return @{
        Url32   = $url32
        Url64   = $url64
        Version = $version + '00'
    }
}

Chocolatey-AU\Update-Package -NoCheckChocoVersion -ChecksumFor none;
