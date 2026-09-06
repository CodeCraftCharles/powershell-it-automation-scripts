$users = Import-Csv "C:\Scripts\newusers.csv"

foreach ($user in $users) {
    $fullName = "$($user.FirstName) $($user.LastName)"

    New-ADUser -Name $fullName `
        -GivenName $user.FirstName `
        -Surname $user.LastName `
        -SamAccountName $user.Username `
        -UserPrincipalName "$($user.Username)@corp.local" `
        -Path $user.OU `
        -AccountPassword (ConvertTo-SecureString "Welcome123!" -AsPlainText -Force) `
        -ChangePasswordAtLogon $true `
        -Enabled $true

    Write-Host "Created user: $fullName"
}