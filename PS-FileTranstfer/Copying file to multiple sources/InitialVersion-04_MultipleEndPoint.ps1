param
(
    # A list of servers
    [Parameter(Mandatory=$true)]
    [string]
    $ServerListPath = ".\ServerList.txt",

    # File to copy
    [Parameter(Mandatory=$true)]
    [string]
    $File,

    # Destination where to copy to (Dest will be path on the server)
    [Parameter(Mandatory=$true)]
    [string]
    $Dest
)

$ServerList = Get-Content -Path $ServerListPath

foreach($Server in $ServerList)
{
  $Destination = "\\$Server" + $Dest
  if(Test-Path -Path $Destination)
  {
    $FileDate = (Get-ChildItem "$Destination\ConfigFile.txt").LastWriteTime
    Write-Output $FileDate
    
    Copy-Item -Path $File -Destination $Destination -Force

    $FileDate = (Get-ChildItem "$Destination\ConfigFile.txt").LastWriteTime
    Write-Output $FileDate
  }
}

#./InitialVersion.ps1 -File "D:\SourceFile\ConfigFile.txt" -Dest "D$\APP01\ConfigFile"