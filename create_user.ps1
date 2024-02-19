Import-Module ActiveDirectory
$GivenName = Read-Host -Prompt "Enter First Name"
$Surname = Read-Host -Prompt "Enter Last Name"
$SecurePW = Read-Host -Prompt "Enter a Password" -AsSecureString
New-ADUser -GivenName $GivenName `
           -Surname $Surname `
           -Name "$GivenName $Surname" `
           -AccountPassword $SecurePW  `
           -SamAccountName $GivenName `
           -DisplayName "$GivenName $Surname" `
           -PasswordNeverExpires $True `
           -UserPrincipalName "$GivenName@skydance.com" `
           -Country "US" `
           -EmailAddress "$GivenName.$Surname@skydance.com" `
           -Path "OU=sdm,OU=Users,OU=LA,DC=sdm,DC=skydance,DC=xyz" `
           -Enabled $True
Set-ADUser -Identity "$GivenName" -Add @{Proxyaddresses="SMTP:$GivenName.$Surname@skydance.com"}