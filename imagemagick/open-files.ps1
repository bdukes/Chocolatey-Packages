ls *.nuspec -recurse | % { notepad $_.FullName }
ls chocolateyInstall.ps1 -recurse | % { notepad $_.FullName }