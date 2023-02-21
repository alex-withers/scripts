$Path = $env:TEMP
$ExeName = "Synology Surveillance Station Client-1.2.9-1082_x64.exe"
Invoke-WebRequest "https://global.download.synology.com/download/Utility/SurveillanceStationClient/1.2.9-1082/Windows/x86_64/Synology%20Surveillance%20Station%20Client-1.2.9-1082_x64.exe" -OutFile $Path\$ExeName
Start-Process -FilePath $Path\$ExeName RunAs -Wait
Remove-Item $Path\$ExeName