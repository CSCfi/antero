Param
(
    [string]$pdlogpath = "d:\temp\logs",
    [string]$gitdir = "D:\temp\testi\git",
    [string]$sqlserver = "dwitvipusql22",
    [string]$database = "ANTERO",
    [string]$tabulardir = "D:\temp\jenkins\tabular\"
)

Add-Type -AssemblyName System.IO.Compression.FileSystem
function Unzip
{
    param([string]$zipfile, [string]$outpath)

    [System.IO.Compression.ZipFile]::ExtractToDirectory($zipfile, $outpath)
}

$connectionString = “Server=$sqlserver;Database=$database;Integrated Security=True;”
$connection = New-Object System.Data.SqlClient.SqlConnection
$connection.ConnectionString = $connectionString

$query = "SELECT [tabular] FROM [$database].[dbo].[tabulardeploy] WHERE [ready] = 0"

$command = $connection.CreateCommand()
$command.CommandText = $query
$connection.Open()

$table = @()

$reader = $command.ExecuteReader()

while ($reader.Read())
{
   $name = $reader.GetValue(0)
   $table += $name
}
$reader.Close()

#check if there is nothing to be deployed
if (-not $table)
{
	exit 0
}

#git clone https://github.com/CSCfi/antero.git
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
Invoke-WebRequest https://github.com/CSCfi/antero/archive/master.zip -OutFile "$gitdir\antero.zip"

$items = @()
#try unzip as many times as necessary
while (-not $items)
{
	Unzip "$gitdir\antero.zip" "$gitdir"
	$items = Copy-Item ($gitdir+"\antero-master\tabular\powershell") ($tabulardir) -recurse -force -PassThru
	
	Start-Sleep -Seconds 3
}

foreach ($tabular in $table)
{
	
	Get-Childitem ($gitdir+"\antero-master\") -recurse -filter $tabular | %{
		Copy-Item -Path $_.FullName -Destination ($tabulardir+$tabular) -recurse
	}
	
    $updateCommand = New-Object System.Data.SqlClient.SqlCommand
    $updateCommand.Connection = $connection
    $updateCommand.commandtext = "UPDATE [$database].[dbo].[tabulardeploy] SET [ready] = 1 WHERE [tabular] = " + "'" + $tabular + "'"
    $updateCommand.executenonquery()
}

Remove-Item $gitdir\* -recurse
$connection.Close()
