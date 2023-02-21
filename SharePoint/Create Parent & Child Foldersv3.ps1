#Connect- to SPO site
Connect-PnPOnline -Url 'https://assureddt.sharepoint.com/sites/Testing' -DeviceLogin -LaunchBrowser
#array of folders
$Customers = @(Import-Csv "E:\Github\adt-alexw-scripts\SharePoint\bitcclients181021.csv")
#Declare the Document Library
$topLevelRoot = "Automation Testing/Clients"  ### No forward slash in the front ###
Write-Host "Destination library is: " $topLevelRoot -f Cyan
#Create the structure
$Customers | Foreach-Object {
    $split = $_ -Split "\\"
    $root = $null
    $previousRoot = $null    
    $i = 0
    $split | Foreach-Object {
        If ($i -ne 0) {
            $previousRoot = $root
            $root = ($root + ‘/’ + $_)
            $current = $_
            
            Write-Host "Sub-Folder Name: $current | Library: $previousRoot" -ForegroundColor Magenta 
            Add-PnPFolder -Name $current -Folder $previousRoot 
        }
        Else {
            $root = ($topLevelRoot + ‘/’ + $_)
            $current = $_
            
            Write-Host "Folder Name: $current | Library: $topLevelRoot" -ForegroundColor Cyan 
            Add-PnPFolder -Name $current -Folder $topLevelRoot
        }
        $i++
    }
}

$SubFolder = @(
    "Supplier Contracts" 
    "Customer Contracts"
    "Sales"
    "Documentation"
    "Projects & Statement of Works"
    "IT Strategies"
    "Service Account Management"
    "Sales\Proposals & Tenders"
    "Sales\Quotes"
    "Sales\Invoices"
    "Documentation\Photos"
    "Service Account Management\Service Reports"
    "Service Account Management\Review Meetings"
    "Sales\Quotes\2022"
    "Sales\Invoices\2022"
)

$siteURL="https://assureddt.sharepoint.com/sites/Testing"  
$folder="/Automation Testing"  
# Loop through to get all the folders and subfolders  
Function GetFolders($folderUrl)  
{      
    $folderColl=Get-PnPFolderItem -FolderSiteRelativeUrl $folderUrl -ItemType Folder   
    # Loop through the folders  
    foreach($folder in $folderColl)  
    {                      
       $newFolderURL= $folderUrl+"/"+$folder.Name   
       write-host -ForegroundColor Green $folder.Name " - " $newFolderURL  
       # Call the function to get the folders inside folder  
       GetFolders($newFolderURL)  
    }           
}  
#Declare the Document Library
$topLevelRoot = "Automation Testing/Clients/$newFolderURL"  ### No forward slash in the front ###
Write-Host "Destination library is: " $topLevelRoot -f Cyan
#Create the structure
$SubFolder | Foreach-Object {
    $split = $_ -Split "\\"
    $root = $null
    $previousRoot = $null    
    $i = 0
    $split | Foreach-Object {
        If ($i -ne 0) {
            $previousRoot = $root
            $root = ($root + ‘/’ + $_)
            $current = $_
            
            Write-Host "Sub-Folder Name: $current | Library: $previousRoot" -ForegroundColor Magenta 
            Add-PnPFolder -Name $current -Folder $previousRoot 
        }
        Else {
            $root = ($topLevelRoot + ‘/’ + $_)
            $current = $_
            
            Write-Host "Folder Name: $current | Library: $topLevelRoot" -ForegroundColor Cyan 
            Add-PnPFolder -Name $current -Folder $topLevelRoot
        }
        $i++
    }
}