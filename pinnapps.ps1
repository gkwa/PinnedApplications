[CmdletBinding()]
Param(
    [Parameter(Mandatory=$false)] [switch]$trace=$false
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

##############################

if(!(test-path "$tbfolder\Cygwin2.lnk"))
{
    $p = "$osdrive\cygwin*\Cygwin2.lnk"
    if(test-path $p)
    {
	Set-PinnedApplication -Action PinToTaskbar -FilePath $p
    }
}

##############################

if(!(test-path "$tbfolder\MySQL Workbench*"))
{
    $p = (get-childitem([Environment]::getfolderpath("ProgramFiles") + '*' + '\MySQL\MySQL Workbench*\MySQLWorkbench.exe')).fullname
    Set-PinnedApplication -Action PinToTaskbar -FilePath $p
}

##############################
