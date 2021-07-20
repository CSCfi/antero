
$SecPasswd = ConvertTo-SecureString $env:PBIPW -AsPlainText -Force

$Cred = New-Object System.Management.Automation.PSCredential($env:PBIUN,$SecPasswd)

# Login to Power BI
Connect-PowerBIServiceAccount -Credential $Cred

# Get workspaceid
$WSID = (Get-PowerBIWorkspace -Name $env:PBIWS -Scope Individual).Id

# Get datasetid
$DSID = Get-PowerBIDataset -Scope Individual -WorkspaceId $WSID | `
Where {$_.Name -eq $env:PBIDS} | ForEach {$_.Id}

$RefreshDS = 'groups/' + $WSID + '/datasets/' + $DSID + '/refreshes'

$RefreshDSCheck = 'groups/' + $WSID + '/datasets/' + $DSID + '/refreshes?$top=1'

$MailFailureNotify = @{"notifyOption"="MailOnFailure"}

# Refresh dataset
Invoke-PowerBIRestMethod -Url $RefreshDS -Method Post -Body $MailFailureNotify

# Refresh status of dataset
$RefreshStatus = "Unknown"

$limit = (Get-Date).AddMinutes(90)

# While loop runs until dataset refresh has been completed or failed. Time limit for the loop is 90 minutes. 
while ($RefreshStatus -eq "Unknown" -and (Get-Date) -le $limit)
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

# Saves refresh status in a file
Out-File -FilePath D:\PBI\RefreshStatus\Status.csv -InputObject $RefreshStatus -Encoding ASCII -Width 50