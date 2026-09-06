Write-Host "=== Inactive Account Finder ===" -ForegroundColor Cyan
Write-Host "Checking for accounts inactive for 30+ days..." 
Write-Host ""

$thresholdDate = (Get-Date).AddDays(-30)

$inactiveUsers = Get-ADUser -Filter {Enabled -eq $true} -Properties LastLogonDate |
    Where-Object { $_.LastLogonDate -lt $thresholdDate -or $_.LastLogonDate -eq $null } |
    Select-Object Name, SamAccountName, LastLogonDate

if ($inactiveUsers.Count -eq 0) {
    Write-Host "No inactive accounts found." -ForegroundColor Green
} else {
    $inactiveUsers | Format-Table -AutoSize
    Write-Host "Found $($inactiveUsers.Count) inactive account(s)." -ForegroundColor Yellow
}