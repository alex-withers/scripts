$credentials = Get-Credential
Write-Output "Getting the Exchange Online cmdlets"
  
$Session = New-PSSession -ConnectionUri https://outlook.office365.com/powershell-liveid/ `
-ConfigurationName Microsoft.Exchange -Credential $credentials `
-Authentication Basic -AllowRedirection
Import-PSSession $Session
 
$users = Get-Mailbox -ResultSize Unlimited | Where-Object{$_.PrimarySMTPAddress -match "wickleaacademy.com"}
 
foreach($user in $users){
    Write-Host "Adding Alias $($user.alias)@waycroft.co.uk"
    Set-Mailbox $user.PrimarySmtpAddress -EmailAddresses @{add="$($user.Alias)@waycroft.co.uk"}

}