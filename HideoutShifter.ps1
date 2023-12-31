# $FileName - The name of the file to be manipulated
# $xChange - The value by which hideout items should be shifted on the X axis
# $yChange - The value by which hideout items should be shifted on the Y axis

$FileName = Read-Host "Hideout File Name"
$FileSplit = $FileName.Split('.')
$xChange = Read-Host "X Shift"
$yChange = Read-Host "Y Shift"

$NewFile = $FileSplit[0] + "Shifted.hideout"
Write-Output $NewFile
rm $NewFile
New-Item -Name $NewFile

foreach ($line in (Get-Content $FileName))
{
	if ($line.Contains("`"x`""))
	{
		$a = $line.Split(':')
		$xValue = $a[1].Trim()
		$xValue = ($xValue.Split(','))[0]
		$xValue = ([int]$xValue + [int]$xChange)
		$a[1] = [string]$xValue + ','
		$newLine = $a -join ":"
		Add-Content $NewFile $newLine
	}
	elseif ($line.Contains("`"y`""))
	{
		$a = $line.Split(':')
		$yValue = $a[1].Trim()
		$yValue = ($yValue.Split(','))[0]
		$yValue = ([int]$yValue + [int]$yChange)
		$a[1] = [string]$yValue + ','
		$newLine = $a -join ":"
		Add-Content $NewFile $newLine
	}
	else
	{
		Add-Content $NewFile $line
	}
