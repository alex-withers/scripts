$siteURL="https://assureddt.sharepoint.com/sites/Clients"
$folderRoot = "Shared Documents/"
#$folderRoot = "Shared Documents/MDS Technologies/"

$customers = Import-Csv "C:\ADT\Github\adt-alexw-scripts\SharePoint\adtclients.csv"
#$customers = Import-Csv "E:\Github\adt-alexw-scripts\SharePoint\mdscustomers.csv"

$folders = @(
    "/Supplier Contracts" 
	"/Customer Contracts"
	"/Sales"
	"/Documentation"
	"/Projects & Statement of Works"
	"/IT Strategies"
	"/Service Account Management"
	"/Software Development"
	"/Sales/Proposals & Tenders"
	"/Documentation/Photos"
	"/Service Account Management/Incident Reports"
	"/Service Account Management/Review Meetings"
	"/Sales/Proposals & Tenders/2023"
	"/Sales/Quotes/2023"
)

# Connect to SharePoint Online site  
Connect-PnPOnline –Url $siteURL -UseWebLogin

ForEach ($customer in $customers)
{
    ForEach ($folder in $folders)
    {
        $folderIdentity = $folderRoot + $customer.Name + $folder
        Write-Host $folderIdentity
        Set-PnPFolderPermission -list "Documents" -identity $folderIdentity -User "SP - ADT All" -AddRole 'Staff' -ClearExisting
        Set-PnPFolderPermission -list "Documents" -identity $folderIdentity -User "SP - Clients - Create Folder Permission" -AddRole 'Full Control'
    }
    #exit
}
