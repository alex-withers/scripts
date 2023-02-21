$siteURL="https://assureddt.sharepoint.com/sites/Client"
$folderRoot = "Shared Documents"
#$folderRoot = "Shared Documents/MDS Technologies/"

$customers = Import-Csv "C:\ADT\Github\adt-alexw-scripts\SharePoint\adtclients.csv"
#$customers = Import-Csv "C:\BITC\PowerShellJoy\mdscustomers.csv"


# Connect to SharePoint Online site  
Connect-PnPOnline –Url $siteURL -UseWebLogin

ForEach ($customer in $customers)
{
    New-PnPTerm -name $customer.Name -Termset "Client" -TermGroup "Clients" -Lcid 1033
}
