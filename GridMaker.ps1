$xCount = 0
$yCount = 0
$objCount = 0

rm Grid.hideout
New-Item -Name Grid.hideout

while ($xCount -le 20)
{
	$yCount = 0
	while ($yCount -le 20)
	{
		
		Add-Content Grid.hideout "    `"Ancient Vessel`": {"
		Add-Content Grid.hideout "      `"hash`": 4112801366,"
		$xCoord = 153 + ([int]$xCount * 20)
		$xLine = "      `"x`": " + [string]$xCoord + ","
		Add-Content Grid.hideout $xLine
		$yCoord = 153 + ([int]$yCount * 20)
		$yLine = "      `"y`": " + [string]$yCoord + ","
		Add-Content Grid.hideout $yLine
		Write-Output $xLine $yLine
		Add-Content Grid.hideout "      `"r`": 0,"
		Add-Content Grid.hideout "      `"fv`": 0"
		Add-Content Grid.hideout "    },"
		$runningCount = "X count: " + [string]$xCount + "	Y Count: " + [string]$yCount
		Write-Output $runningCount
		Write-Output $objCount
		$yCount++
		$objCount++

	}
	$xCount++
}

Write-Output $objCount