all: test2
all: test3

test3:
	powershell -noprofile -executionpolicy unrestricted -command install.ps1
	powershell -noprofile -executionpolicy unrestricted -file pinnpath.ps1 -path 'C:\Program Files*\MySQL\MySQL*\MySQLWorkbench.exe'

test2:
	powershell -noprofile -executionpolicy unrestricted -command install.ps1
	powershell -noprofile -executionpolicy unrestricted -file pinnpath.ps1 -path 'c:\cygwin*\Cygwin2.lnk'

debug:
	powershell -noprofile -executionpolicy unrestricted -command install.ps1
	powershell -noprofile -executionpolicy unrestricted -file pinnpath.ps1 -trace
