#Setting the Credentials for the SIMS Setups folder
cmdkey /add:WOODLANDS-DC1 /U WAYCROFTACAMDEY\WoodlandsSIMS /p SteelServeEarly14!
cmdkey /add:10.13.152.7 /U WAYCROFTACAMDEY\WoodlandsSIMS /p SteelServeEarly14!
cmdkey /add:WOODLANDS-DC1.waycroftacademy.com /U WAYCROFTACAMDEY\WoodlandsSIMS /p SteelServeEarly14!

pushd %~dp0
@ECHO OFF

net use s: /delete

net use s: \\10.13.152.7\SIMSWoodlands /P:Yes

copy \\10.13.152.7\SIMSWoodlands\inifiles\connect.ini c:\Windows\ /Y
copy \\10.13.152.7\SIMSWoodlands\inifiles\connect.ini "C:\Program Files (x86)\SIMS\SIMS .net\" /Y
copy \\10.13.152.7\SIMSWoodlands\inifiles\sims.ini c:\Windows\ /Y
copy \\10.13.152.7\SIMSWoodlands\inifiles\sims.ini "C:\Program Files (x86)\SIMS\SIMS .net\" /Y


msg * "You are now Connected to Woodlands SIMS. Now double click the blue SIMS Icon to load SIMS - and don't forget to send biscuits to your friendly IT dept :)"