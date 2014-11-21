$package = 'hg'
$productName = 'Mercurial'

try {
	$app = Get-WmiObject -class Win32_Product -filter "Name LIKE '$productName%' AND Version='3.2.1'"
	$result = $app.Uninstall();

	Write-ChocolateySuccess $package
}
catch {
	Write-ChocolateyFailure $package "$($_.Exception.Message)"
	throw
}