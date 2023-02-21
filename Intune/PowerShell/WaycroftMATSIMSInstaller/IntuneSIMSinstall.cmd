md "C:\SIMS"
copy /Y .\IntuneSIMSinstall.ps1 "C:\SIMS"
cd "C:\SIMS"
Powershell.exe -executionpolicy remotesigned -File  C:\SIMS\IntuneSIMSinstall.ps1