Write-Host "=== Installed Software Report ===" -ForegroundColor Cyan
Write-Host ""

$software = Get-ItemProperty HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\* |
    Where-Object { $_.DisplayName -ne $null } |
    Select-Object DisplayName, DisplayVersion, Publisher |
    Sort-Object DisplayName

$software | Format-Table -AutoSize

Write-Host ""
Write-Host "Total programs found: $($software.Count)" -ForegroundColor Yellow

$software | Export-Csv -Path "C:\Scripts\InstalledSoftware.csv" -NoTypeInformation
Write-Host "Report saved to C:\Scripts\InstalledSoftware.csv" -ForegroundColor Green