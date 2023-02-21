$siteURL="https://assureddt.sharepoint.com/sites/Clients"
$folder = "Shared Documents/Bristol IT Company_backup05112020/BMT/Support"
 
 
 
 $file = Get-PnPFolder -Url "$($folder)" -Includes ListItemAllFields.RoleAssignments, ListItemAllFields.HasUniqueRoleAssignments
        
        #$context.Load($file);
        #$context.ExecuteQuery();

       
            foreach($roleAssignments in $file.ListItemAllFields.RoleAssignments)
            {
                Get-PnPProperty -ClientObject $roleAssignments -Property RoleDefinitionBindings, Member

                $permission.LoginName = $roleAssignments.Member.LoginName
                $permission.LoginTitle = $roleAssignments.Member.Title
                $permission.PrincipalType = $roleAssignments.Member.PrincipalType.ToString()
                $permission.Permission = ""
                 #Get the Permissions assigned to user/group
                foreach ($RoleDefinition in $roleAssignments.RoleDefinitionBindings){
                     $permission.Permission = $permission.Permission + "," + $RoleDefinition.Name
                }
            }
       
# Connect to SharePoint Online site  
#Connect-PnPOnline –Url $siteURL -UseWebLogin

