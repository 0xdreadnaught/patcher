#this script assumes that each target requires the same credentials
#change to what ever browser you want
#modify wait times to suite the speed of the host and target

$addresses = @() #populate with addresses. ex: target1.com or 1.2.3.4
$myshell = New-Object -com "WScript.Shell"

#just get the browser going, first tab will be empty
[System.Diagnostics.Process]::Start("firefox")
Start-Sleep -Seconds 6

#load tab for target, enter credentials, loop to next target
foreach($link in $addresses){
	[System.Diagnostics.Process]::Start("firefox","https://$link")
	Start-Sleep -Seconds 4
	$myshell.sendkeys("USERNAMEHERE")
	$myshell.sendkeys("{TAB}")
	$myshell.sendkeys("PASSWORDHERE")
	$myshell.sendkeys("{ENTER}")
	Start-Sleep -Seconds 3	
}

#navigate to first tab and kill it
$myshell.sendkeys("^{1}")
Start-Sleep -Seconds 1}
$myshell.sendkeys("^{F$}")