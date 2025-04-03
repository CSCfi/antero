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

$startTime = Get-Date

# Refresh status of dataset
$RefreshStatus = "Unknown"
$RefreshError = "No errors"

# Number of times the refresh failed
$errors = 0

ECHO "################################################"

ECHO $Dataset

# Do not attempt refresh if previous refresh attempt is still ongoing. 
if ((ConvertFrom-Json (Invoke-PowerBIRestMethod -Url $RefreshDSCheck -Method Get)).value.status -ne "Unknown"){

	# While loop ensures that the refresh is attempted two times in case of error
	while(($errors -lt 2) -and ($RefreshStatus -ne "Completed")) {
		
		$error.clear()
		$RefreshStatus = "Unknown"
		
		# Refresh dataset and error handling
		Invoke-PowerBIRestMethod -Url $RefreshDS -Method Post -Body $MailFailureNotify
		if (!$error) {
			
			$limit = (Get-Date).AddMinutes(180)

			# While loop runs until dataset refresh has been completed or failed. Time limit for the loop is 3 hours. 

			while ($RefreshStatus -eq "Unknown" -and (Get-Date) -le $limit) {	
				$RefreshStatus = (ConvertFrom-Json (Invoke-PowerBIRestMethod -Url $RefreshDSCheck -Method Get)).value.status
				ECHO "Inspecting refresh status..."
				Start-Sleep -s 30
			}

			if ($RefreshStatus -eq "Completed") {
				$RefreshError = "No errors"
				ECHO "Refresh was completed successfully"
			} elseif ($RefreshStatus -eq "Failed") {
				ECHO "Refresh attempt failed"
				$RefreshError = (ConvertFrom-Json (Invoke-PowerBIRestMethod -Url $RefreshDSCheck -Method Get)).value.serviceExceptionJson
				$errors = $errors + 1
				ECHO $RefreshError
			} elseif ((Get-Date) -gt $limit) {
				$RefreshError = "Timeout. Refresh status unknown"
				ECHO "Timeout. Refresh status unknown"
				$errors = $errors + 2 # Skip retry
			} else {
				$RefreshError = "Something unexpected happened"
				ECHO "Something unexpected happened"
				$errors = $errors + 1
			}

		} else {
			ECHO "Refresh attempt failed immediately"
			$RefreshStatus = "Failed"
			$RefreshError = ((Resolve-PowerBIError).Message)[0]
			$errors = $errors + 1
		}
	}

	if ($RefreshStatus -eq "Failed") {
		ECHO "Refresh failed"
	}
} else {
	ECHO "Previous refresh attempt is still ongoing."
	$RefreshStatus = "Ongoing"
}

ECHO "################################################"

$endTime = Get-Date

$duration = $endTime - $startTime

$duration = $duration.ToString("hh\:mm\:ss")

$output = "$Dataset;$RefreshStatus;$startTime;$endTime;$duration;$RefreshError"

Out-File -FilePath D:\PBI\RefreshStatus\RefreshPending.csv -InputObject $output -Encoding utf8 -Width 50