Import-Module Chocolatey-AU;
Import-Module '../../_scripts/Get-GitHubRelease.psm1';
Import-Module "$env:ChocolateyInstall\helpers\chocolateyInstaller.psm1";

$release = Get-GitHubRelease rustdesk rustdesk;

function global:au_GetLatest {

  $version = $release.tag_name;

  $tag = $version;
  $ReleaseNotes = "https://github.com/rustdesk/rustdesk/releases/tag/$($tag)";

  @{
    Version           = $version
    ReleaseNotes      = $ReleaseNotes
  }
}

function global:au_SearchReplace {
  @{
      'rustdesk.nuspec' = @{
        '(^\s*<dependency id="rustdesk.install" version=")(\[.*\])(" />)' = "`$1[$($Latest.Version)]`$3"
      }
  }
}

function global:au_AfterUpdate {
  Update-Metadata -key "releaseNotes" -value $Latest.ReleaseNotes;
}

Update-Package -ChecksumFor all;
