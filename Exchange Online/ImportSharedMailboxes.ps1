Import-Csv "E:\Github\adt-alexw-scripts\Exchange Online\sharedmailboxes.csv" | foreach-object { New-Mailbox -shared -Name $_.name -DisplayName $_.displayname -Alias $_.alias -PrimarySmtpAddress $_.PrimarySmtpAddress}