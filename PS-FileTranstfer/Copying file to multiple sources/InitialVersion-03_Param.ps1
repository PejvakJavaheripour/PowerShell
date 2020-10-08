param
(
    # A list of servers
    [Parameter(Mandatory=$false)]
    [string]
    $ServerListPath = ".\ServerList.txt",

    # File to copy
    [Parameter(Mandatory=$true)]
    [string]
    $File,

    # Destination where to copy to 
    [Parameter(Mandatory=$true)]
    [string]
    $Dest
)

$Destination = "\\$Server" + $Dest   #$Dest will be path on the server
$ServerList = Get-Content -Path $ServerListPath

foreach($Server in $ServerList)
{
  Test-Path -Path $Destination
}

# Copy-Item -Path $File -Destination $Dest -Force

# $FileData = (Get-ChildItem "$dest\ConfigFile.txt").CreationTime