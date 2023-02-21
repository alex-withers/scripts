$siteURL="https://assureddt.sharepoint.com/sites/Clients"
$thefolder = "Shared Documents/Bristol IT Company_backup05112020/The Bottle Yard Studios [TBYS]"

Function GetFolders($folderUrl)  
{      
    $folderColl=Get-PnPFolderItem -FolderSiteRelativeUrl $folderUrl -ItemType Folder   
    # Loop through the folders  
    foreach($folder in $folderColl)  
    {                      
       $newFolderURL= $folderUrl+"/"+$folder.Name   
       write-host $folder.Name " - " $newFolderURL  
       # Call the function to get the folders inside folder  
       #GetFolders($newFolderURL)  
       if($folder.Name -eq "Support")
       {
            write-host "Found the support folder!"
       }
    }           
}  

# Connect to SharePoint Online site  
#Connect-PnPOnline –Url $siteURL -UseWebLogin
GetFolders($thefolder)
