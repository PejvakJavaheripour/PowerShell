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
    try 
    {
      $FileDate = (Get-ChildItem "$dest\ConfigFile.txt" -ErrorAction Stop).LastWriteTime      
      $FileDateSource = (Get-ChildItem $file -ErrorAction Stop).LastWriteTime

      if($FileDate -lt $FileDateSource)
      {
        Copy-Item -Path $File -Destination $Destination -Force -ErrorAction Stop
        Write-Output "File copied to $Server !"
      }
      else 
      {
        Write-Output "The destination file on $Server is more recent!"  
      }

    }
    catch [System.Management.Automation.ItemNotFoundException]
    {
      Write-Output "The destination file on $Server does not exist!. Copying a new version."
      try 
      {
        Copy-Item -Path $File -Destination $Destination -Force -ErrorAction Stop
        Write-Output "File copied to $Server !"  
      }
      catch 
      {
        Write-Output $_.Exception
      }
    }

    catch 
    {
      Write-Output $_.Exception
    }
    else 
    {
      Write-Output "The destination folder structure does not exit on $Server !"  
    }
  }
}

#./InitialVersion.ps1 -File "D:\SourceFile\ConfigFile.txt" -Dest "D$\APP01\ConfigFile"