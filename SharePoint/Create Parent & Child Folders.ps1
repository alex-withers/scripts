# location where the subfolders will be created
Set-Location D:\TEST
 
# csv file with folder names
$Folders = Import-Csv E:\Github\adt-alexw-scripts\SharePoint\bitcclients181021.csv
$FirstFolderName1 = "/Supplier Contracts"
$FirstFolderName2 = "/Customer Contracts"
$FirstFolderName3 = "/Sales"
$FirstFolderName4 = "/Documentation"
$FirstFolderName5 = "/Projects & Statement of Works"
$FirstFolderName6 = "/IT Strategies"
$FirstFolderName7 = "/Service Account Management"
$SecondFolderName1 = "/Sales/Proposals & Tenders"
$SecondFolderName2 = "/Sales/Quotes"
$SecondFolderName3 = "/Sales/Invoices"
$SecondFolderName4 = "/Documentation/Photos"
$SecondFolderName5 = "/Service Account Management/Service Reports"
$SecondFolderName8 = "/Service Account Management/Review Meetings"
$ThirdFolderName1 = "/Sales/Quotes/2022"
$ThirdFolderName2 = "/Sales/Invoices/2022"

$FoldersToCreate = @(
	"/Supplier Contracts" 
	"/Customer Contracts"
	"/Sales"
	"/Documentation"
	"/Projects & Statement of Works"
	"/IT Strategies"
	"/Service Account Management"
	"/Sales/Proposals & Tenders"
	"/Sales/Quotes"
	"/Sales/Invoices"
	"/Documentation/Photos"
	"/Service Account Management/Service Reports"
	"/Service Account Management/Review Meetings"
	"/Sales/Quotes/2022"
	"/Sales/Invoices/2022"
)

ForEach ($Folder in $Folders) { 
New-Item $Folder.name -itemtype directory
$ClientName = $Folder.name 
	ForEach ($SubFolder in $FoldersToCreate) {
		$FullPath = $ClientName + $SubFolder
		New-Item $FullPath -itemtype directory 
	}
#exit
}