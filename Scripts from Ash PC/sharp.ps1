$Path = $env:TEMP
$FileName = "ss0emenu.inf"
Invoke-WebRequest "https://file-transfer.co.uk/bitc/ss0emenu.inf" -OutFile $Path\$FileName
pnputil.exe -i -a C:\Users\ashleyreed\AppData\Local\Temp\$FileName
Add-PrinterDriver -Name "SHARP MX-2314N PCL6"
Add-PrinterPort -Name "IP_10.10.30.105" -PrinterHostAddress "10.10.30.105"
Add-Printer -Name "Sharp MX-2314N" -DriverName "SHARP MX-2314N PCL6" -PortName IP_10.10.30.105