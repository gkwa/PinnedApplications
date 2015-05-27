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

$pathexpanded = (get-childitem($path)).fullname

# Unpin
try
{
    Set-PinnedApplication -Action UnPinFromTaskbar -FilePath $pathexpanded

} catch {
    $message = ($_.Exception).Message

    if('Verb Unpin from Taskbar not found.' -match $message)
    {
	# I don't care if its not yet pinned

    }else{
	echo $_.Exception|format-list -force
    }
}

# Pin
try
{
    if(test-path $pathexpanded)
    {
	Set-PinnedApplication -Action PinToTaskbar -FilePath $pathexpanded
    }

} catch {

    echo $_.Exception|format-list -force

    if(1 -eq $error.Count)
    {
	$error.Clear()
    }

}
