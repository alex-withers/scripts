#Setting the Credentials for the SIMS Setups folder
cmdkey /add:WICKLEA-DC1 /U WAYCROFTACAMDEY\WickleaSIMS /p SteelServeEarly14!
cmdkey /add:10.15.28.14 /U WAYCROFTACAMDEY\WickleaSIMS /p SteelServeEarly14!
cmdkey /add:WICKLEA-DC1.waycroftacademy.com /U WAYCROFTACAMDEY\WickleaSIMS /p SteelServeEarly14!

pushd %~dp0
@ECHO OFF

net use s: /delete

net use s: \\10.15.28.14\SIMSWicklea /P:Yes

copy \\10.15.28.14\SIMSWicklea\Curric\connect.ini c:\Windows\ /Y
copy \\10.15.28.14\SIMSWicklea\Curric\connect.ini "C:\Program Files (x86)\SIMS\SIMS .net\" /Y
copy \\10.15.28.14\SIMSWicklea\Curric\sims.ini "C:\Program Files (x86)\SIMS\SIMS .net\" /Y
copy \\10.15.28.14\SIMSWicklea\Curric\sims.ini c:\Windows\ /Y


msg * "You are now Connected to Wicklea SIMS. Now double click the blue SIMS Icon to load SIMS - and don't forget to send biscuits to your friendly IT dept :)"