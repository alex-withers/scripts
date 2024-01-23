$session = New-PSSession –ComputerName \\BMTDB1
Copy-Item –Path C:\ExcelConnect.VSTO.Addin.dll.config –Destination 'C:\Program Files (x86)\Datel Computing Ltd\FUSION Excel Connect Client\Addin' –ToSession $session
$session | Remove-PSSession
