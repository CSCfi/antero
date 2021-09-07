
$SecPasswd = ConvertTo-SecureString $env:PBIPW -AsPlainText -Force

$Cred = New-Object System.Management.Automation.PSCredential($env:PBIUN,$SecPasswd)

# Fix encoding issues concerning name of the dataset

$DSBytes = [system.text.encoding]::UTF8.GetBytes($env:PBIDS)

$DSBytesToString = $DSBytes -join '-'
$DSBytesToString = $DSBytesToString.replace("226-148-156-195-130", "195-182")
$DSBytesToString = $DSBytesToString.replace("226-148-156-195-177", "195-164")

$DSBytes = $DSBytesToString.split("-")

$Dataset = [system.text.encoding]::UTF8.GetChars($DSBytes)
$Dataset = $Dataset -join ''

# Login to Power BI
Connect-PowerBIServiceAccount -Credential $Cred

# Get workspaceid
$WSID = (Get-PowerBIWorkspace -Name $env:PBIWS -Scope Individual).Id

# Get datasetid
$DSID = Get-PowerBIDataset -Scope Individual -WorkspaceId $WSID | `
Where {$_.Name -eq $Dataset} | ForEach {$_.Id}

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

	ECHO $Dataset

	while ($RefreshStatus -eq "Unknown" -and (Get-Date) -le $limit) {	
		$RefreshStatus = (ConvertFrom-Json (Invoke-PowerBIRestMethod -Url $RefreshDSCheck -Method Get)).value.status
		ECHO "Inspecting refresh status..."
		Start-Sleep -s 30
	}

	if ($RefreshStatus -eq "Completed") {
		ECHO "Refresh was completed successfully"
	} elseif ($RefreshStatus -eq "Failed") {
		ECHO "Refresh failed"
		$RefreshError = (ConvertFrom-Json (Invoke-PowerBIRestMethod -Url $RefreshDSCheck -Method Get)).value.serviceExceptionJson
		ECHO $RefreshError
	} else {
		ECHO "Something unexpected happened"
	}

	ECHO "################################################"
} else {
	ECHO "Refresh failed immediately"
	$RefreshStatus = "Failed"
}

$endTime = Get-Date

$duration = $endTime - $startTime

$duration = $duration.ToString("hh\:mm\:ss")

$output = "$Dataset;$RefreshStatus;$startTime;$endTime;$duration"

Out-File -FilePath D:\PBI\RefreshStatus\Refresh.csv -InputObject $output -Encoding utf8 -Width 50
