$computerName = hostname

$LocalGroupName = “Administrators”

$Group = [ADSI](“WinNT://$computerName/$localGroupName,group”)

$Group.Members() |

foreach {

    $AdsPath = $_.GetType().InvokeMember(‘Adspath’, ‘GetProperty’, $null, $_, $null)

    $A = $AdsPath.split(‘/’,[StringSplitOptions]::RemoveEmptyEntries)

    $Names = $a[-1]

    $Domain = $a[-2]

    If ($Domain -eq $ComputerName -and $Names -ne “Administrator”) {

        Add-Content C:WindowsTempRemoveUsersFromAdminGroup.log “User $Names found on computer $computerName … ”

        $Group.Remove(“$AdsPath”)

        Add-Content C:WindowsTempRemoveUsersFromAdminGroup.log “Removed”

    }

}