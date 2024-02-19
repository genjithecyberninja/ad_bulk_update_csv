# import csv file into variable as objects
$csv = Import-CSV C:\ad_bulk_update.csv

# iterate each attribute in the csv/object
ForEach ($User in $csv)

# Selects the user | sets the user's atribute
{
Get-ADUser -Identity $User.samAccountName | set-ADUser -Company $($User.Company)
}