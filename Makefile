test:
	powershell -noprofile -executionpolicy unrestricted -command install.ps1
	powershell -noprofile -executionpolicy unrestricted -file pinnapps.ps1
debug:
	powershell -noprofile -executionpolicy unrestricted -command install.ps1
	powershell -noprofile -executionpolicy unrestricted -file pinnapps.ps1 -trace
