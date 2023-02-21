Function Remove-LocalUser
{
  <#
      .Synopsis
      This function deletes a local user 
      .Description
      This function deletes a local user
      .Example
      Remove-LocalUser -userName "ed" 
      Removes a new local user named ed. 
      .Parameter ComputerName
      The name of the computer upon which to delete the user
      .Parameter UserName
      The name of the user to delete
      .Notes
      NAME:  Remove-LocalUser
      AUTHOR: ed wilson, msft
      LASTEDIT: 06/29/2011 10:07:42
      KEYWORDS: Local Account Management, Users
      HSG: HSG-06-30-11
      .Link
      Http://www.ScriptingGuys.com/blog
      #Requires -Version 2.0
  #>
  [CmdletBinding()]
  Param(
    [Parameter(Position=0,
        Mandatory=$True,
      ValueFromPipeline=$True)]
    [string]$userName
  )
  $computerName = $env:ComputerName
  $User = [ADSI]"WinNT://$computerName"
  $user.Delete('user',$userName)
} #end function Remove-LocalUser

$localUsers = Get-WmiObject -Class Win32_UserAccount -Filter  "LocalAccount='True'" | Select-Object Name
foreach ($localUser in  $localUsers.Name){
  Write-Host $localUser
  Remove-LocalUser -userName $localUser
  Get-WMIObject -class Win32_UserProfile | Where {(!$_.Special) -and (!$_.Loaded)} | Remove-WmiObject –WhatIf

}