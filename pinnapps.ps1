[CmdletBinding()]
Param(
    [Parameter(Mandatory=$false)] [switch]$trace=$false,
    [Parameter(Mandatory=$false)] [string]$path
)

if($trace){set-psdebug -Strict -Trace 2}else{set-psdebug -Strict -Trace 0}

import-module PinnedApplications

$tbfolder = [Environment]::getfolderpath("applicationdata") + '\Microsoft\Internet Explorer\Quick Launch\User Pinned\TaskBar'
$osdrive = (Get-WmiObject Win32_OperatingSystem).SystemDrive

if(!(test-path "$tbfolder"))
{
    Write-Error "I can't taskbar folder $tbfolder"
    Exit
}

$name = split-path $path -leaf -resolve # For $path=c:\cygwin64\Cygwin2.lnk, $name is Cygwin2.lnk
$nameSansExt = [io.path]::GetFileNameWithoutExtension($name)

# $pathInTaskBar = join-path $tbfolder $name
$pathInTaskBar = join-path $tbfolder ($nameSansExt + '.lnk')
write-host $pathInTaskbar
# example: C:\Users\Administrator\AppData\Roaming\Microsoft\Internet Explorer\Quick Launch\User Pinned\TaskBar\Cygwin2.lnk

if(test-path $pathInTaskbar)
{
    Set-PinnedApplication -Action UnPinFromTaskbar -FilePath $pathInTaskbar
}

$p = (get-childitem($path)).fullname
if(test-path $p)
{
    Set-PinnedApplication -Action PinToTaskbar -FilePath $p
}
