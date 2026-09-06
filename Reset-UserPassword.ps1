$username = Read-Host "Enter the username to reset"

$newPassword = ConvertTo-SecureString "Reset123!" -AsPlainText -Force

Set-ADAccountPassword -Identity $username -NewPassword $newPassword -Reset
Set-ADUser -Identity $username -ChangePasswordAtLogon $true

Write-Host "Password reset for $username. They must change it at next logon."