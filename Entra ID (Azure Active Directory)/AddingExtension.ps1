$groupId = "cd41c54b-1342-453f-b2b9-78cdd83ef549"
$users = Get-AzureADGroupMember -ObjectId $groupId -All $true

foreach ($user in $users) {
    Set-AzureADUserExtension -ObjectId $user.ObjectId -ExtensionName "extensionAttribute2" -ExtensionValue "Exclude"
}
