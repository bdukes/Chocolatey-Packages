Enable-MicrosoftUpdate
Install-WindowsUpdate -AcceptEula
Update-ExecutionPolicy RemoteSigned
Set-ExplorerOptions -showHiddenFilesFoldersDrives -showFileExtensions
Enable-RemoteDesktop
#Move-LibraryDirectory "Personal" "$env:UserProfile\skydrive\documents"

choco install IIS-WebServerRole -source windowsfeatures
choco install IIS-HttpCompressionDynamic -source windowsfeatures
choco install IIS-ManagementScriptingTools -source windowsfeatures
choco install IIS-WindowsAuthentication -source windowsfeatures
choco install IIS-DigestAuthentication -source windowsfeatures
choco install IIS-BasicAuthentication -source windowsfeatures
choco install IIS-ASPNET -source windowsfeatures
choco install IIS-ASPNET45 -source windowsfeatures
choco install IIS-NetFxExtensibility -source windowsfeatures
choco install IIS-NetFxExtensibility45 -source windowsfeatures
choco install IIS-HttpRedirect -source windowsfeatures

choco install powershell
choco install urlrewrite 
choco install FirefoxESR
choco install GoogleChrome
choco install Opera
choco install opera-developer
#choco install Brave
#choco install Vivaldi
#choco install Firefox-Dev-Aurora
#choco install lastpass
#choco install FreeDownloadManager
#choco install curl
choco install filezilla
#choco install selfssl7
choco install pscx
#choco install conemu
choco install 7zip.install
choco install 7zip.commandline
choco install DefaultProgramsEditor
choco install lockhunter
choco install sysinternals
#choco install clipx -version 1.0.3.9-beta
choco install ditto
#choco install greenshot
choco install sharex
choco install sox.portable
choco install paint.net
choco install imagemagick.tool
#choco install graphicsmagick
choco install teamviewer 
choco install skype
choco install spacesniffer
choco install dropbox
#choco install skydrive
#choco install googledrive
#choco install vim
choco install vim-x64
choco install notepad2
choco install visualstudiocode
choco install atom
#choco install VisualStudio2013Professional -InstallArguments "Features:'WebTools SQL'"
choco install expresso
choco install papercut
choco install fiddler4
choco install NugetPackageExplorer
choco install nuget.commandline
#choco install diffmerge
choco install winmerge
#choco install dotpeek
choco install linqpad
choco install NAnt
#choco install resharper
#choco install stylecop
choco install gitextensions
choco install gittfs
choco install python2
choco install nodejs
choco install vlc
choco install musicbee
choco install steam
choco install ffmpeg
choco install slack
choco install mousewithoutborders
choco install exercism-io-cli

#Install-ChocolateyPinnedTaskBarItem "$env:home\Dropbox\Applications\cmder\Cmder.exe"
#Install-ChocolateyPinnedTaskBarItem "$($Boxstarter.programFiles86)\Google\Chrome\Application\chrome.exe"
#Install-ChocolateyPinnedTaskBarItem "$($Boxstarter.programFiles86)\Mozilla Firefox\firefox.exe"
Install-ChocolateyPinnedTaskBarItem "$env:windir\system32\notepad.exe"
Install-ChocolateyPinnedTaskBarItem "$($Boxstarter.programFiles86)\WinMerge\WinMergeU.exe"
#Install-ChocolateyPinnedTaskBarItem "$($Boxstarter.programFiles86)\LINQPad4\LINQPad.exe"
#Install-ChocolateyPinnedTaskBarItem "$($Boxstarter.programFiles86)\Microsoft Visual Studio 12.0\Common7\IDE\devenv.exe"
Install-ChocolateyPinnedTaskBarItem "$env:windir\system32\inetsrv\InetMgr.exe"
Install-ChocolateyPinnedTaskBarItem "$($Boxstarter.programFiles86)\Microsoft SQL Server\110\Tools\Binn\ManagementStudio\Ssms.exe"

#Install-ChocolateyFileAssociation ".dll" "$($Boxstarter.programFiles86)\Jetbrains\dotPeek\v1.2\Bin\dotPeek32.exe"

#copy-item (Join-Path (Get-PackageRoot($MyInvocation)) 'ConEmu.xml') -Force $env:ProgramFiles\ConEmu\ConEmu\ConEmu.xml

#Install-ChocolateyVsixPackage JSLint http://visualstudiogallery.msdn.microsoft.com/1a417c37-4d6f-43ca-b753-6ea6eb5041fd/file/84638/4/JSLint.VS2012.vsix
#Install-ChocolateyVsixPackage WebEssentials2013 http://visualstudiogallery.msdn.microsoft.com/56633663-6799-41d7-9df7-0f2a504ca361/file/105627/17/WebEssentials2013.vsix
#Install-ChocolateyVsixPackage xunit.runner.visualstudio http://visualstudiogallery.msdn.microsoft.com/463c5987-f82b-46c8-a97e-b1cde42b9099/file/66837/11/xunit.runner.visualstudio.vsix
#Install-ChocolateyVsixPackage NUnitVisualStudioTestAdapter http://visualstudiogallery.msdn.microsoft.com/6ab922d0-21c0-4f06-ab5f-4ecd1fe7175d/file/66177/13/NUnitVisualStudioTestAdapter-1.0.vsix
#Install-ChocolateyVsixPackage WebWorkbench http://visualstudiogallery.msdn.microsoft.com/2b96d16a-c986-4501-8f97-8008f9db141a/file/53962/41/Mindscape.WebWorkbench.Integration.10.vsix

#Turn off Attach to Process warning (lots of assumptions about existing/non-existing keys/values here)
#Set-ItemProperty HKCU:\Software\Microsoft\VisualStudio\12.0\Debugger DisableAttachSecurityWarning 1

#Turn off Aero Shake
New-Item -Path HKCU:\Software\Policies\Microsoft\Windows\Explorer
Set-ItemProperty HKCU:\Software\Policies\Microsoft\Windows\Explorer NoWindowMinimizingShortcuts 1
