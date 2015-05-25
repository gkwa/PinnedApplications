$d1 = [environment]::getfolderpath("mydocuments")
$d2 = "$d1\WindowsPowerShell\Modules\PinnedApplications"

if(!(test-path "$d2")) {
    $result = new-item -Path "$d2" -ItemType Directory
}
Copy ((Get-Location).Path + "\" + "PinnedApplications.psm1") "$d2"
