Get-Process OUTLOOK  -ErrorAction SilentlyContinue| % { $_.CloseMainWindow() }

Move-Item -force C:\Users\$ENV:UserName\AppData\Local\Microsoft\Outlook  C:\Users\$ENV:UserName\AppData\Local\Microsoft\1Outlook1
Move-Item -force C:\Users\$ENV:UserName\AppData\Roaming\Microsoft\Outlook C:\Users\$ENV:UserName\AppData\Roaming\Microsoft\1Outlook1


$wshell = New-Object -ComObject Wscript.Shell
$wshell.Popup("Rebuild Complete",3,"Done")

Start-Sleep -s 3

start outlook.exe