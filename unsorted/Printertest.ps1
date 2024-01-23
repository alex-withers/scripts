$url ="https://bristolmusictrust.sharepoint.com/:u:/g/EXbt4qAEm6lIoQkZJ5j_paoBEOMmahrc0UrPwShKcn4_2g?e=VSteL0"
$output ="C:\AdminPrinter"
$start_time = Get-Date

Invoke-WebRequest -Uri $url -OutFile $output


Set-Location -Path C:\AdminPrinter

ddout.exe
