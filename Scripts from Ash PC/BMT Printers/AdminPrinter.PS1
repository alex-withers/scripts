#region Parameters
#Define Parameter LogPath
param (
    $LogPath = "C:\Temp\Add-IntunePrinter.txt",
    $printerHost = "192.168.29.9",
    $printerName = "Admin Office"
)
#endregion

#region variables
$MaxAgeLogFiles = 30
#Driver Vars
$driverUrl = "http://downloadserver.academicdownload.com/printdrivers/hp.zip"
$tempPath = "C:\temp\"
$driverZip = $tempPath + "hp.zip"
$driverPath = $tempPath + "hp\"
$infPath = $driverPath + "*.inf"
$driverName = "HP Universal Printing PCL 6"
$portName = "IP_" + $printerHost
#endregion


#region functions
#Define Log function
Function Write-Log {
    Param ([string]$logstring)

    $DateLog = Get-Date -Format "dd/MM/yyyy HH:mm:ss"
    $WriteLine = $DateLog + "|" + $logstring
    try {
        Add-Content -Path $LogPath -Value $WriteLine -ErrorAction Stop
    }
    catch {
        Start-Sleep -Milliseconds 100
        Write-Log $logstring
    }
}
#endregion


#region Log file creation
#Create Log file
try {
    #Create log file based on logPath parameter followed by current date
    $date = Get-Date -Format yyyyMMddTHHmmss
    $date = $date.replace("/", "").replace(":", "")
    $logpath = $logpath.insert($logpath.IndexOf(".txt"), " $date")
    $logpath = $LogPath.Replace(" ", "")
    New-Item -Path $LogPath -ItemType File -Force -ErrorAction Stop

    #Delete all log files older than x days (specified in $MaxAgelogFiles variable)
    try {
        $limit = (Get-Date).AddDays(-$MaxAgeLogFiles)
        Get-ChildItem -Path $logPath.substring(0, $logpath.LastIndexOf("\")) -Force | Where-Object { !$_.PSIsContainer -and $_.CreationTime -lt $limit } | Remove-Item -Force
    }
    catch {
        $ErrorMessage = $_.Exception.Message
        Write-Log $ErrorMessage
    }
}
catch {
    #Throw error if creation of loge file fails
    $wshell = New-Object -ComObject Wscript.Shell
    $wshell.Popup($_.Exception.Message, 0, "Creation Of LogFile failed", 0x1)
    exit
}

Function Check-Printer($printerName) {
    Write-Log "[INFO] - Starting Function Check-Printer"
    If (Get-Printer -Name $printerName -EA SilentlyContinue){
        Write-Log "[ERROR] - Printer $printerName already exists, exiting"
        Exit
    }
    Write-Log "[INFO] - Ending Function Check-Printer"
}

Function Check-PrinterPort ($portName,$printerHost) {
    Write-Log "[INFO] - Starting Function Check-PrinterPort ($portName)"
    If (Get-PrinterPort -Name $portName -EA SilentlyContinue){
        Write-Log "[INFO] - Printer port already exists"
    }
    else{
        Try{
            Add-PrinterPort -Name $portName -PrinterHostAddress $printerHost
            Write-Log "[INFO] - Added printerport"
        }
        Catch{
            Write-Log "[ERROR] - Error adding printerport"
            Write-Log "$($_.Exception.Message)"
        }
        
        Write-Log "[INFO] - Added printerport $portName for Host $printerHost"
    }
    Write-Log "[INFO] - Ending Function Check-PrinterPort ($portName)"
}

Function Get-Drivers ($driverUrl,$driverZip, $driverPath) {
    Write-Log "[INFO] - Starting Function Get-Drivers"
    Try{
        (New-Object System.Net.WebClient).DownloadFile($driverUrl, $driverZip)
        Write-Log "[INFO] - Downloaded drivers, sleeping 3 seconds to $driverzip"
        Start-Sleep 3
    }
    Catch{
        Write-Log "[ERROR] - Error downloading drivers"
        Write-Log "$($_.Exception.Message)"
    }

    Try{
        Expand-Archive $driverZip -DestinationPath $driverPath -Force
        Start-Sleep 3
        Write-Log "[INFO] - Expanded driver zip to $driverPath"
    }
    Catch{
        Write-Log "[ERROR] - Error unzipping drivers"
        Write-Log "$($_.Exception.Message)"
    }
    Write-Log "[INFO] - Ending Function Get-Drivers"
}

Function Install-PrinterDriver($driverName,$infPath){
    Write-Log "[INFO] - Starting Function Install-PrinterDrive"
    Try{
        Invoke-Command {c:\windows\sysnative\pnputil.exe /add-driver $infPath }
        Write-Log "[INFO] - Installed print driver"
    }
    Catch{
        Write-Log "[ERROR] - Error adding printerdriver $infPath"
        Write-Log "$($_.Exception.Message)"
    }

    Try{
        Add-PrinterDriver -Name $driverName
        Write-Log "[INFO] - Installed print driver $drivername"
    }
    Catch{
        Write-Log "[ERROR] - Error adding printerdriver $infPath"
        Write-Log "$($_.Exception.Message)"
    }
    Write-Log "[INFO] - Ending Function Install-PrinterDrive"
}

Function Add-Printers($printerName,$driverName,$portName) {
    Write-Log "[INFO] - Starting Function Add-Printer"
    Try{
        Add-Printer -Name $printerName -DriverName $driverName -PortName $portName
        Write-Log "[INFO] - Added printer succesfuly $printerName"
    }
    Catch{
        Write-Log "[ERROR] - Error adding printer"
        Write-Log "$($_.Exception.Message)"
    }
    Write-Log "[INFO] - Ending Function Add-Printer"
}

#endregion

#region Operational Script
Write-Log "[INFO] - Starting script"
Check-Printer $printerName

Check-PrinterPort $portName $printerHost

Get-Drivers -driverUrl $driverUrl -driverzip $driverzip -driverPath $driverPath

Install-PrinterDriver $driverName $infPath

Add-Printers -printerName $printerName  -DriverName $driverName -portName $portName

CleanUp-Temp $driverZip $driverPath

Write-Log "[INFO] - Stopping script"