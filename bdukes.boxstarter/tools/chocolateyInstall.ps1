Install-WindowsUpdate
Set-ExplorerOptions -showHidenFilesFoldersDrives -showFileExtensions
Enable-RemoteDesktop
#Move-LibraryDirectory "Personal" "$env:UserProfile\skydrive\documents"

cinstm IIS-WebServerRole -source windowsfeatures
cinstm IIS-HttpCompressionDynamic -source windowsfeatures
cinstm IIS-ManagementScriptingTools -source windowsfeatures
cinstm IIS-WindowsAuthentication -source windowsfeatures

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

#need to figure out why this is pointing to main boxstarter package instead of mine
#copy-item (Join-Path $(Split-Path -parent $MyInvocation.MyCommand.Definition) 'ConEmu.xml') -Force $env:ProgramFiles\ConEmu\ConEmu\ConEmu.xml

#Install-ChocolateyVsixPackage JSLint http://visualstudiogallery.msdn.microsoft.com/1a417c37-4d6f-43ca-b753-6ea6eb5041fd/file/84638/4/JSLint.VS2012.vsix
Install-ChocolateyVsixPackage WebEssentials2013 http://visualstudiogallery.msdn.microsoft.com/56633663-6799-41d7-9df7-0f2a504ca361/file/105627/17/WebEssentials2013.vsix
#Install-ChocolateyVsixPackage WebWorkbench http://visualstudiogallery.msdn.microsoft.com/2b96d16a-c986-4501-8f97-8008f9db141a/file/53962/41/Mindscape.WebWorkbench.Integration.10.vsix

#Turn off Attach to Process warning (lots of assumptions about existing/non-existing keys/values here)
Set-ItemProperty HKCU:\Software\Microsoft\VisualStudio\12.0\Debugger DisableAttachSecurityWarning 1
#New-Item -Path HKCU:\Software\Wow6432Node\Microsoft\VisualStudio
#New-Item -Path HKCU:\Software\Wow6432Node\Microsoft\VisualStudio\12.0
#New-Item -Path HKCU:\Software\Wow6432Node\Microsoft\VisualStudio\12.0\Debugger
#Set-ItemProperty HKCU:\Software\Wow6432Node\Microsoft\VisualStudio\12.0\Debugger DisableAttachSecurityWarning 1