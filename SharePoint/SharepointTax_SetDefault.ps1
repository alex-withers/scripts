$siteURL="https://assureddt.sharepoint.com/sites/Clients"
#$folderRoot = "Bristol IT Company/"
$folderRoot = "MDS Technologies/"

#$customers = Import-Csv "C:\BITC\PowerShellJoy\bitcclients.csv"
$customers = Import-Csv "C:\BITC\PowerShellJoy\mdscustomers.csv"

# Connect to SharePoint Online site  
#Connect-PnPOnline –Url $siteURL -UseWebLogin

ForEach ($customer in $customers)
{
    write-host "Trying to do: " $customer.Name
    $value = "Clients|Client|" +  $customer.Name
    write-host "value is: $value"
    $folder = $folderRoot + $customer.Name
    write-host "folder is: $folder"
    Set-PnpDefaultColumnValues -List "Documents" -Field "Tag" -Value $value -Folder $folder
}
