
$SecPasswd = ConvertTo-SecureString $env:PBIPW -AsPlainText -Force

$Cred = New-Object System.Management.Automation.PSCredential($env:PBIUN,$SecPasswd)

Connect-PowerBIServiceAccount -Credential $Cred

$WSID = (Get-PowerBIWorkspace -Name $env:PBIWS -Scope Individual).Id

$DSID = Get-PowerBIDataset -Scope Individual -WorkspaceId $WSID | `
Where {$_.Name -eq $env:PBIDS} | ForEach {$_.Id}

$RefreshDS = 'groups/' + $WSID + '/datasets/' + $DSID + '/refreshes'

$MailFailureNotify = @{"notifyOption"="MailOnFailure"}

Invoke-PowerBIRestMethod -Url $RefreshDS -Method Post -Body $MailFailureNotify