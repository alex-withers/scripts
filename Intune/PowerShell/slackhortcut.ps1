$objShell = New-Object -ComObject ("WScript.Shell")
$objShortCut = $objShell.CreateShortcut($env:USERPROFILE + "\Start Menu\Programs\Startup" + "\slack.lnk")
$objShortCut.TargetPath=("c:\Program Files\Slack\slack.exe")
$objShortCut.Save()