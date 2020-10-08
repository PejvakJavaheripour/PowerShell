$File = "C:\SourceFile\ConfigFile.txt"
$Dest = "\\SRVAPP01\D$\APP01\ConfigFile"

Copy-Item -Path $File -Destination $Dest -Force

$FileData = (Get-ChildItem "$Dest\ConfigFile.txt")
$FileData = (Get-ChildItem "$Dest\ConfigFile.txt").CreationTime