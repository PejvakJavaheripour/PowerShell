$File = "D:\SourceFile\ConfigFile.txt"
$Dest = "\\$Server\D$\APP01\ConfigFile"

$ServerList = Get-Content -Path ".\ServerList.txt"

foreach($Server in $ServerList)
{
  Test-Path -Path $Dest
}

Copy-Item -Path $File -Destination $Dest -Force

$FileData = (Get-ChildItem "$dest\ConfigFile.txt").CreationTime