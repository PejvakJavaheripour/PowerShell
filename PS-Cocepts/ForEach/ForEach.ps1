Import-Csv "C:\MyBox\ForEach\CSV_File\File.csv"

$OurObjectsArray = Import-Csv "C:\MyBox\ForEach\CSV_File\File.csv"

foreach($Object in $OurObjectsArray){Write-Host "The name of the object is:" $Object.ObjectPropertyName}

foreach($Object in $OurObjectsArray){Write-Host "The name of the object is:" $Object.ObjectPropertyName -ForeGroundColor $Object.ObjectPropertyColor}

$TotalOfNumberColumn = 0

foreach($Object in $OurObjectsArray){Write-Host "The name of the object is:" $Object.ObjectPropertyName -ForeGroundColor $Object.ObjectPropertyColor; $TotalOfNumberColumn = $TotalOfNumberColumn + $Object.ObjectPropertyNumber}

Write-Host "The total number of the number column is:" $TotalOfNumberColumn

foreach($Object in $OurObjectsArray)
{
    Write-Host "The name of the object is:" $Object.ObjectPropertyName -ForeGroundColor $Object.ObjectPropertyColor
    $TotalOfNumberColumn = $TotalOfNumberColumn + $Object.ObjectPropertyNumber
    If ($Object.ObjectPropertyNumber -gt 1000)
    {
    Write-Host "This Object is biger than 1000:" $Object.ObjectPropertyName
    }
}

Write-Host "The total number of the number column is:" $TotalOfNumberColumn
