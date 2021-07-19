
$SecPasswd = ConvertTo-SecureString $env:PBIPW -AsPlainText -Force

$Cred = New-Object System.Management.Automation.PSCredential($env:PBIUN,$SecPasswd)

Connect-PowerBIServiceAccount -Credential $Cred

$WSID = (Get-PowerBIWorkspace -Name $env:PBIWS -Scope Individual).Id

$DSID = Get-PowerBIDataset -Scope Individual -WorkspaceId $WSID | `
Where {$_.Name -eq $env:PBIDS} | ForEach {$_.Id}

$RefreshDS = 'groups/' + $WSID + '/datasets/' + $DSID + '/refreshes'

$RefreshDSCheck = 'groups/' + $WSID + '/datasets/' + $DSID + '/refreshes?$top=1'

$MailFailureNotify = @{"notifyOption"="MailOnFailure"}

Invoke-PowerBIRestMethod -Url $RefreshDS -Method Post -Body $MailFailureNotify

$RefreshStatus = "Unknown"

while ($RefreshStatus -eq "Unknown")
{	
	$RefreshStatus = (ConvertFrom-Json (Invoke-PowerBIRestMethod -Url $RefreshDSCheck -Method Get)).value.status
	ECHO "Inspecting refresh status..."
	Start-Sleep -s 30
}

if ($RefreshStatus -eq "Completed") {
    ECHO "Refresh was completed"
} elseif ($RefreshStatus -eq "Failed") {
    ECHO "Refresh failed"
} else {
    ECHO "Something unexpected happened"
}