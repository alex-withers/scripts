$Userslist = Import-CSV "E:\Github\adt-alexw-scripts\Exchange Online\Distribution-Groups-Members.csv"
ForEach ($User in $Userslist)
{
Add-DistributionGroupMember -Identity "Waycroft Group Suppliers2" -Member $User.Email
}