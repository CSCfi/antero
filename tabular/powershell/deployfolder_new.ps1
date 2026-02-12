Param
(
    #[string]$modelfile = "D:\Temp\testi\Model.bim",
    [string]$pdlogpath = "d:\temp\logs",
    [string]$tabularsdir = "D:\temp\jenkins\tabular\",
    [string]$prodtabserver = "dwitviputab22",
    [string]$prodsqlserver = "dwitvipusql22",
    [string]$proddatabase = "ANTERO",
    [string]$workdir = "D:\temp\jenkins\work\",
    [string]$exe = "C:\Program Files (x86)\Microsoft SQL Server\130\Tools\Binn\ManagementStudio\Microsoft.AnalysisServices.Deployment.exe"#,
    #[string]$username = "USERNAME",
    #[string]$password = "PASSWORD"
)

$pdlogfile = "logfile.log"                    #File name for logs

# 1. Import powershelllogging module. 
Import-Module PowerShellLogging 

# 2. Start logging 
# Format date and time for the logfilename
$sdate = ((get-date).ToString("yyyyMMdd_HHmmss_"))

# Add timestamp to script log
get-date | out-file -filePath (Join-Path $pdlogpath $pdlogfile) -Encoding ascii -Force

# Start logging 
$pdlog =  $sdate + $pdlogfile

# Define logfile  
$pdLogFile = Enable-LogFile -Path (Join-Path $pdlogpath $pdlog)

$ScriptPath = Split-Path $MyInvocation.MyCommand.Path
$files = get-childitem $tabularsdir"*.bim" -recurse

if (-not $files)
{
	exit 0
}

forEach ($file in $files)
{
    Write-Host "Processing file:" $file.FullName
    $projectfile = get-childitem $file.DirectoryName"*.smproj"
    $xml = [xml](Get-Content $projectfile.FullName)
    if ($xml.Project.PropertyGroup[1].DeploymentServerDatabase)
    {
        $projectname = $xml.Project.PropertyGroup[1].DeploymentServerDatabase
    }
    elseif ($xml.Project.PropertyGroup[0].DeploymentServerDatabase)
    {
        $projectname = $xml.Project.PropertyGroup[0].DeploymentServerDatabase
    }
    else
    {
        $projectname = $xml.Project.PropertyGroup[2].DeploymentServerDatabase
    }
	
    $xml = [xml](Get-Content ($workdir + "Model.deploymenttargets"))
    $xml.DeploymentTarget.Database = $projectname
    $xml.Save($workdir + "Model.deploymenttargets")
    $destfile = $workdir + "Model.bim"
    Remove-Item $destfile
	
    if([bool]((Get-Content $file) -as [xml]))
    {
        $asdatabase = $file.DirectoryName + "\bin\" + $file.BaseName + ".asdatabase"
        Copy-Item $asdatabase $destfile
    }
    else
    {
        Copy-Item $file $destfile
    }
    
    & "$ScriptPath\tabulardeploy_new.ps1" $workdir"Model.bim" $workdir $prodtabserver $prodsqlserver $proddatabase $exe
}

Remove-Item $tabularsdir* -recurse -exclude powershell,*.ps1

$pdLogFile | Disable-LogFile
