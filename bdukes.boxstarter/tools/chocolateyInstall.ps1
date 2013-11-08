Install-WindowsUpdate -AcceptEula
Set-ExecutionPolicy RemoteSigned
Set-ExplorerOptions -showHidenFilesFoldersDrives -showFileExtensions
Enable-RemoteDesktop
#Move-LibraryDirectory "Personal" "$env:UserProfile\skydrive\documents"

cinst IIS-WebServerRole -source windowsfeatures
cinst IIS-HttpCompressionDynamic -source windowsfeatures
cinst IIS-ManagementScriptingTools -source windowsfeatures
cinst IIS-WindowsAuthentication -source windowsfeatures
cinst IIS-DigestAuthentication -source windowsfeatures
cinst IIS-BasicAuthentication -source windowsfeatures
cinst IIS-ASPNET -source windowsfeatures
cinst IIS-ASPNET45 -source windowsfeatures
cinst IIS-NetFxExtensibility -source windowsfeatures
cinst IIS-NetFxExtensibility45 -source windowsfeatures
cinst IIS-HttpRedirect -source windowsfeatures

cinst Firefox
cinst GoogleChrome
#cinst lastpass
cinst FreeDownloadManager
cinst curl
cinst filezilla
cinst selfssl7
cinst pscx
cinst conemu
cinst 7zip.install
cinst 7zip.commandline
cinst DefaultProgramsEditor
cinst lockhunter
#cinst devbox-rapidee #not silent
cinst sysinternals
cinst clipx -version 1.0.3.9-beta
cinst greenshot
cinst sox.portable
cinst paint.net
cinst imagemagick.tool
cinst skype
cinst spacesniffer
cinst dropbox
cinst skydrive
cinst googledrive
cinst vim
cinst notepad2
#cinst VisualStudio2013Professional
cinst expresso
cinst papercut
cinst fiddler
cinst NugetPackageExplorer
cinst diffmerge
cinst winmerge
cinst dotpeek
cinst linqpad4
cinst NAnt
cinst resharper
cinst stylecop
cinst gitextensions
cinst gittfs
cinst nodejs.install

Install-ChocolateyPinnedTaskBarItem "$env:programfiles\ConEmu\ConEmu64.exe"
Install-ChocolateyPinnedTaskBarItem "$($Boxstarter.programFiles86)\Google\Chrome\Application\chrome.exe"
Install-ChocolateyPinnedTaskBarItem "$($Boxstarter.programFiles86)\Mozilla Firefox\firefox.exe"
Install-ChocolateyPinnedTaskBarItem "$env:windir\system32\notepad.exe"
Install-ChocolateyPinnedTaskBarItem "$($Boxstarter.programFiles86)\WinMerge\WinMergeU.exe"
Install-ChocolateyPinnedTaskBarItem "$($Boxstarter.programFiles86)\LINQPad4\LINQPad.exe"
Install-ChocolateyPinnedTaskBarItem "$($Boxstarter.programFiles86)\Microsoft Visual Studio 12.0\Common7\IDE\devenv.exe"
Install-ChocolateyPinnedTaskBarItem "$env:windir\system32\inetsrv\InetMgr.exe"
Install-ChocolateyPinnedTaskBarItem "$($Boxstarter.programFiles86)\Microsoft SQL Server\110\Tools\Binn\ManagementStudio\Ssms.exe"

Install-ChocolateyFileAssociation ".dll" "$($Boxstarter.ChocolateyBin)\dotPeek.bat"

copy-item (Join-Path (Get-PackageRoot($MyInvocation)) 'ConEmu.xml') -Force $env:ProgramFiles\ConEmu\ConEmu\ConEmu.xml

#Install-ChocolateyVsixPackage JSLint http://visualstudiogallery.msdn.microsoft.com/1a417c37-4d6f-43ca-b753-6ea6eb5041fd/file/84638/4/JSLint.VS2012.vsix
Install-ChocolateyVsixPackage WebEssentials2013 http://visualstudiogallery.msdn.microsoft.com/56633663-6799-41d7-9df7-0f2a504ca361/file/105627/17/WebEssentials2013.vsix
Install-ChocolateyVsixPackage xunit.runner.visualstudio http://visualstudiogallery.msdn.microsoft.com/463c5987-f82b-46c8-a97e-b1cde42b9099/file/66837/11/xunit.runner.visualstudio.vsix
Install-ChocolateyVsixPackage NUnitVisualStudioTestAdapter http://visualstudiogallery.msdn.microsoft.com/6ab922d0-21c0-4f06-ab5f-4ecd1fe7175d/file/66177/13/NUnitVisualStudioTestAdapter-1.0.vsix
#Install-ChocolateyVsixPackage WebWorkbench http://visualstudiogallery.msdn.microsoft.com/2b96d16a-c986-4501-8f97-8008f9db141a/file/53962/41/Mindscape.WebWorkbench.Integration.10.vsix

#Turn off Attach to Process warning (lots of assumptions about existing/non-existing keys/values here)
Set-ItemProperty HKCU:\Software\Microsoft\VisualStudio\12.0\Debugger DisableAttachSecurityWarning 1
#New-Item -Path HKCU:\Software\Wow6432Node\Microsoft\VisualStudio
#New-Item -Path HKCU:\Software\Wow6432Node\Microsoft\VisualStudio\12.0
#New-Item -Path HKCU:\Software\Wow6432Node\Microsoft\VisualStudio\12.0\Debugger
#Set-ItemProperty HKCU:\Software\Wow6432Node\Microsoft\VisualStudio\12.0\Debugger DisableAttachSecurityWarning 1