New-Item -ItemType Directory -Force -Path C:\Temp
New-Item -ItemType Directory -Force -Path "C:\Program Files (x86)\Sage\"
$Url = 'https://file-transfer.co.uk/bitc/bmtsage/Sage200.zip'
$ZipFile = 'C:\Temp\' + $(Split-Path -Path $Url -Leaf)
$Destination= 'C:\Program Files (x86)\Sage\'
 
Invoke-WebRequest -Uri $Url -OutFile $ZipFile
 
$ExtractShell = New-Object -ComObject Shell.Application
$Files = $ExtractShell.Namespace($ZipFile).Items()
$ExtractShell.NameSpace($Destination).CopyHere($Files)
Start-Process $Destination

