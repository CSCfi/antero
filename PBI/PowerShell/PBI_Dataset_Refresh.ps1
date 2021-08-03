
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

$error.clear()

$startTime = Get-Date

# Refresh dataset and error handling
Invoke-PowerBIRestMethod -Url $RefreshDS -Method Post -Body $MailFailureNotify
if (!$error) {
	# Refresh status of dataset
	$RefreshStatus = "Unknown"

	$limit = (Get-Date).AddMinutes(60)

	# While loop runs until dataset refresh has been completed or failed. Time limit for the loop is 60 minutes. 

	ECHO "################################################"

	ECHO $env:PBIDS

	while ($RefreshStatus -eq "Unknown" -and (Get-Date) -le $limit) {	
		$RefreshStatus = (ConvertFrom-Json (Invoke-PowerBIRestMethod -Url $RefreshDSCheck -Method Get)).value.status
		ECHO "Inspecting refresh status..."
		Start-Sleep -s 30
	}

	if ($RefreshStatus -eq "Completed") {
		ECHO "Refresh was completed successfully"
	} elseif ($RefreshStatus -eq "Failed") {
		ECHO "Refresh failed"
	} else {
		ECHO "Something unexpected happened"
	}

	ECHO "################################################"
} else {
	ECHO "Refresh failed"
}

$endTime = Get-Date

$duration = $endTime - $startTime

$duration = $duration.ToString("hh\:mm\:ss")

$output = "$env:PBIDS;$RefreshStatus;$startTime;$endTime;$duration"

Out-File -FilePath D:\PBI\RefreshStatus\Refresh.csv -InputObject $output -Encoding ASCII -Width 50
