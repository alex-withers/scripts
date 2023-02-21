$objShell = New-Object -ComObject ("WScript.Shell")
$objShortCut = $objShell.CreateShortcut($env:USERPROFILE + "Start Menu\Programs\Startup" + "\Communicator.lnk")
$objShortCut.TargetPath("C:\Program Files (x86)\Gamma\Horizon\Communicator.exe")
$objShortCut.Save()