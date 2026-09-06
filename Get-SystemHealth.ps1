Write-Host "=== System Health Check ===" -ForegroundColor Cyan
Write-Host ""

Write-Host "Disk Space:" -ForegroundColor Yellow
Get-WmiObject Win32_LogicalDisk -Filter "DriveType=3" | ForEach-Object {
    $freeGB = [math]::Round($_.FreeSpace / 1GB, 2)
    $totalGB = [math]::Round($_.Size / 1GB, 2)
    $percentFree = [math]::Round(($_.FreeSpace / $_.Size) * 100, 1)
    Write-Host "Drive $($_.DeviceID) - $freeGB GB free of $totalGB GB ($percentFree% free)"
}

Write-Host ""
Write-Host "Memory Usage:" -ForegroundColor Yellow
$os = Get-WmiObject Win32_OperatingSystem
$freeMemGB = [math]::Round($os.FreePhysicalMemory / 1MB, 2)
$totalMemGB = [math]::Round($os.TotalVisibleMemorySize / 1MB, 2)
Write-Host "$freeMemGB GB free of $totalMemGB GB total"