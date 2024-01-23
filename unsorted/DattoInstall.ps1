$url = "https://merlot.centrastage.net/csm/profile/downloadAgent/c98f926b-5030-4b80-887f-519b0f2edd15"
$outpath = "C:\temp\Datto\AgentSetup_Stephenson+Law.exe"
Invoke-WebRequest -Uri $url -OutFile $outpath
$wc = New-Object System.Net.WebClient
$wc.DownloadFile($url, $outpath)
$args = @("Comma","Separated","Arguments")
Start-Process -Filepath "C:\temp\Datto\AgentSetup_Stephenson+Law.exe" -ArgumentList $args