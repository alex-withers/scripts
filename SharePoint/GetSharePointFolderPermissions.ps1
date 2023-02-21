#Load SharePoint CSOM Assemblies
Add-Type -Path "C:\Program Files\Common Files\Microsoft Shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.dll"
Add-Type -Path "C:\Program Files\Common Files\Microsoft Shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"

# Input Parameters  
$siteURL="https://assureddt.sharepoint.com/sites/Testing"  
$folder="/Shared Documents"  
  
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

#Function to Get Folder Permissions
Function Get-SPOFolderPermission([String]$SiteURL, [String]$FolderRelativeURL)
{
    Try{
        #Setup the context
        $Ctx = New-Object Microsoft.SharePoint.Client.ClientContext($SiteURL)
        $Ctx.Credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($Cred.Username, $Cred.Password)
      
        #Get the Folder
        $Folder = $Ctx.Web.GetFolderByServerRelativeUrl($FolderRelativeURL)
        $Ctx.Load($Folder)
        $Ctx.ExecuteQuery()
 
        #Get permissions assigned to the Folder
        $RoleAssignments = $Folder.ListItemAllFields.RoleAssignments
        $Ctx.Load($RoleAssignments)
        $Ctx.ExecuteQuery()
 
        #Loop through each permission assigned and extract details
        $PermissionCollection = @()
        Foreach($RoleAssignment in $RoleAssignments)
        {
            $Ctx.Load($RoleAssignment.Member)
            $Ctx.executeQuery()
 
            #Get the User Type
            $PermissionType = $RoleAssignment.Member.PrincipalType
 
            #Get the Permission Levels assigned
            $Ctx.Load($RoleAssignment.RoleDefinitionBindings)
            $Ctx.ExecuteQuery()
            $PermissionLevels = ($RoleAssignment.RoleDefinitionBindings | Select -ExpandProperty Name) -join ","
             
            #Get the User/Group Name
            $Name = $RoleAssignment.Member.Title # $RoleAssignment.Member.LoginName
 
            #Add the Data to Object
            $Permissions = New-Object PSObject
            $Permissions | Add-Member NoteProperty Name($Name)
            $Permissions | Add-Member NoteProperty Type($PermissionType)
            $Permissions | Add-Member NoteProperty PermissionLevels($PermissionLevels)
            $PermissionCollection += $Permissions
        }
        Return $PermissionCollection
    }
    Catch {
    write-host -f Red "Error Getting Folder Permissions!" $_.Exception.Message
    }
}

# Connect to SharePoint Online site  
Connect-PnPOnline –Url $siteURL -UseWebLogin 
  
# Call the functions  
GetFolders($folder)
Get-SPOFolderPermission $SiteURL $FolderRelativeURL | Export-CSV "C:\Temp\FolderPermissions.csv" -NoTypeInformation
