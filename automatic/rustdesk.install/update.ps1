Import-Module Chocolatey-AU
Import-Module '../../_scripts/Get-GitHubRelease.psm1'
Import-Module "$env:ChocolateyInstall\helpers\chocolateyInstaller.psm1"

$release = Get-GitHubRelease rustdesk rustdesk

function global:au_GetLatest {
  $Url64 = $release.assets | Where-Object {$_.name -match 'x86_64' } | Where-Object { $_.name.endswith('.msi') } | Select-Object -First 1 -ExpandProperty browser_download_url

  $version = $release.tag_name
  $ChecksumType = 'sha256'

  $tag = $version
  $ReleaseNotes = "https://github.com/rustdesk/rustdesk/releases/tag/$($tag)"

  @{
    Url64             = $Url64
    Version           = $version
    ChecksumType64    = $ChecksumType
    ReleaseNotes      = $ReleaseNotes
  }
}

function global:au_SearchReplace {
  @{
      'tools\chocolateyInstall.ps1' = @{
          "(^[$]url64\s*=\s*)('.*')"          = "`$1'$($Latest.Url64)'"
          "(^[$]checksum64\s*=\s*)('.*')"     = "`$1'$($Latest.Checksum64)'"
          "(^[$]checksumType64\s*=\s*)('.*')" = "`$1'$($Latest.ChecksumType64)'"
      }
      'tools\VERIFICATION.txt' = @{
        "(?i)(64-Bit.+)\<.*\>"     = "`${1}<$($Latest.Url64)>"
      }
  }
}

function global:au_AfterUpdate {
  Update-Metadata -key "releaseNotes" -value $Latest.ReleaseNotes
}

Update-Package -ChecksumFor 64
  @{
      'tools\chocolateyInstall.ps1' = @{
          "(^[$]url64\s*=\s*)('.*')"          = "`$1'$($Latest.Url64)'"
          "(^[$]checksum64\s*=\s*)('.*')"     = "`$1'$($Latest.Checksum64)'"
          "(^[$]checksumType64\s*=\s*)('.*')" = "`$1'$($Latest.ChecksumType64)'"
      }
      'tools\VERIFICATION.txt' = @{
        "(?i)(64-Bit.+)\<.*\>"     = "`${1}<$($Latest.Url64)>"
      }
  }
}

function global:au_AfterUpdate {
  Update-Metadata -key "releaseNotes" -value $Latest.ReleaseNotes
}

Update-Package -ChecksumFor 64
