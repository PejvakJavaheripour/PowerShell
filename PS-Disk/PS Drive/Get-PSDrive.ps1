Get-PSDrive | Where-Object {$_.Free -gt 1}

Get-PSDrive | Where-Object {$_.Free -gt 1} | Select-Object Root, Used, Free

Get-PSDrive | Where-Object {$_.Free -gt 1} | ForEach-Object {Write-Host "Free space for" $_.Root "is" $_.Free -ForegroundColor Red}

Get-PSDrive | Where-Object {$_.Free -gt 1} | ForEach-Object {Write-Host "Free space for" $_.Root "is" ($_.Free/1gb) -ForegroundColor Red}

Get-PSDrive | Where-Object {$_.Free -gt 1} | ForEach-Object {Write-Host "Free space for" $_.Root "is" ("{0:N2}" -f ($_.Free/1gb)) -ForegroundColor Red}

Get-PSDrive | Where-Object {$_.Free -gt 1} | ForEach-Object{$Count = 0; Write-Host "";} {"This Volume ==> " + ($_.Name) + "  >> has : Used: " + "{0:N2}" -f ($_.Used/1gb) + " Free: " + "{0:N2}" -f ($_.free/1gb) + " Total: " + "{0:N2}" -f (($_.Used/1gb)+($_.Free/1gb)); $Count = $Count + $_.Free;}{Write-Host"";Write-Host "Total Free Space " ("{0:N2}" -f ($Count/1gb)) -backgroundcolor magenta}

# get-volume shows you and returns the same data.
