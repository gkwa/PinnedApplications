test3:
	powershell -noprofile -executionpolicy unrestricted -command install.ps1
	powershell -noprofile -executionpolicy unrestricted -file pinnapps.ps1 -path 'C:\Program Files*\MySQL\MySQL*\MySQLWorkbench.exe'

test2:
	powershell -noprofile -executionpolicy unrestricted -command install.ps1
	powershell -noprofile -executionpolicy unrestricted -file pinnapps.ps1 -path 'c:\cygwin*\Cygwin2.lnk'

test:
	powershell -noprofile -executionpolicy unrestricted -command install.ps1
	powershell -noprofile -executionpolicy unrestricted -file pinnapps.ps1
debug:
	powershell -noprofile -executionpolicy unrestricted -command install.ps1
	powershell -noprofile -executionpolicy unrestricted -file pinnapps.ps1 -trace
