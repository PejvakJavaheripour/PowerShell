Import-Csv "C:\MyBox\ForEach-Object\CSV_File\File.csv"

$OurObjectsArray = Import-Csv "C:\MyBox\ForEach-Object\CSV_File\File.csv"

$OurObjectsArray

$OurObjectsArray.Count

$OurObjectsArray[0]

$OurObjectsArray[2].ObjectPropertyNumber

$OurObjectsArray.ObjectPropertyNumber

$OurObjectsArray | ForEach-Object {Write-Host "The name of the object is:" $_.ObjectPropertyName}

$OurObjectsArray | ForEach-Object {Write-Host "The name of the object is:" $_.ObjectPropertyName -ForegroundColor $_.ObjectPropertyColor}

$TotalOfNumberColumn = 0

$OurObjectsArray | ForEach-Object {Write-Host "The name of the object is:" $_.ObjectPropertyName -ForegroundColor $_.ObjectPropertyColor; $TotalOfNumberColumn = $TotalOfNumberColumn + $_.ObjectPropertyNumber}

$OurObjectsArray | ForEach-Object {Write-Host "The name of the object is:" $_.ObjectPropertyName -ForegroundColor $_.ObjectPropertyColor; $TotalOfNumberColumn += $_.ObjectPropertyNumber}

$TotalOfNumberColumn

$TotalOfNumberColumn = 0

$OurObjectsArray | ForEach-Object{
    Write-Host "The name of the object is:" $_.ObjectPropertyName -ForegroundColor $_.ObjectPropertyColor
    $TotalOfNumberColumn = $TotalOfNumberColumn + $_.ObjectPropertyNumber
    If($_.ObjectPropertyNumber -gt 1000)
    {
        Write-Host "This host is biger than 1000:" $_.ObjectPropertyName
    }
}
