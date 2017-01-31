Param
(
    [string]$pdlogpath = "d:\antero\logs",
    [string]$tabularserver = "dwitviputab16",
    [string]$sqlserver = "dwitvipusql16",
    [string]$database = "ANTERO"
)

[Reflection.Assembly]::LoadWithPartialName("Microsoft.AnalysisServices")
$server = New-Object Microsoft.AnalysisServices.Server
$server.connect($tabularserver)

$pdlogfile = "logfile.log"                    #File name for logs

# 1. Import powershelllogging module. 
Import-Module PowerShellLogging 

# 2. Start logging 
# Format date and time for the logfilename
$sdate = ((get-date).ToString("yyyyMMdd_HHmmss_"))

# Add timestamp to script log
get-date | out-file -filePath (Join-Path $pdlogpath\processing $pdlogfile) -Encoding ascii -Force

# Start logging 
$pdlog =  $sdate + $pdlogfile

# Define logfile  
$pdLogFile = Enable-LogFile -Path (Join-Path $pdlogpath\processing $pdlog)

$connectionString = “Server=$sqlserver;Database=$database;Integrated Security=True;”
$connection = New-Object System.Data.SqlClient.SqlConnection
$connection.ConnectionString = $connectionString

$query = "SELECT DISTINCT [tabular] FROM [$database].[dbo].[tabularprocess] WHERE [ready] = 0"

$command = $connection.CreateCommand()
$command.CommandText = $query
$connection.Open()

$table = @()

$reader = $command.ExecuteReader()

while ($reader.Read())
{
   $name = $reader.GetValue(0);
   $table += $name
}
$reader.Close()

foreach ($tabular in $table)
{
    $error.clear()
    "Aloitettu " + $tabular + " prosessointi " + $(Get-Date)
    $alku = Get-Date
    try
    {
        $b = $server.Databases | ? {$_.Name -eq $tabular} | Select CompatibilityLevel
        if ($b.CompatibilityLevel -ge 1200)
        {
            Invoke-ProcessASDatabase -databasename $tabular -server $tabularserver -RefreshType "Full"
        }
        else
        {
            Invoke-ProcessASDatabase -databasename $tabular -server $tabularserver -ProcessType "ProcessFull"
        }
    }
    catch
    {
        $error[0]
    }
    $kesto = New-Timespan -Start $alku -End $(Get-Date)
    if (!$error)
    {
        $tabular + " prosessoitu " + $(Get-Date) + ", kesto " + $kesto
        $deleteCommand = New-Object System.Data.SqlClient.SqlCommand
        $deleteCommand.Connection = $connection
        $deleteCommand.commandtext = "UPDATE [$database].[dbo].[tabularprocess] SET [ready] = 1 WHERE [tabular] = " + "'" + $tabular + "'"
        $deleteCommand.executenonquery()
    }
    else
    {
        $tabular + " prosessointi epäonnistui " + $(Get-Date) + ", kesto " + $kesto
    }
}

$connection.Close()

$pdLogFile | Disable-LogFile