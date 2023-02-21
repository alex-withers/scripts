#Setting the Credentials for the SIMS Setups folder
cmdkey /add:WAYCROFT-FP1 /U WAYCROFT-FP1\WaycroftSIMS /p SteelServeEarly14!
cmdkey /add:10.16.3.10 /U WAYCROFT-FP1\WaycroftSIMS /p SteelServeEarly14!
cmdkey /add:WAYCROFT-FP1.waycroftacademy.com /U WAYCROFT-FP1\WaycroftSIMS /p SteelServeEarly14!

pushd %~dp0
@ECHO OFF

net use s: /delete

net use s: \\10.16.3.10\SIMSWaycroft /P:Yes

copy \\10.16.3.10\SIMSWaycroft\ini_files\connect.ini c:\Windows\ /Y
copy \\10.16.3.10\SIMSWaycroft\ini_files\connect.ini "C:\Program Files (x86)\SIMS\SIMS .net\" /Y
copy \\10.16.3.10\SIMSWaycroft\ini_files\sims.ini c:\Windows\ /Y
copy \\10.16.3.10\SIMSWaycroft\ini_files\sims.ini "C:\Program Files (x86)\SIMS\SIMS .net\" /Y

msg * "You are now Connected to Waycroft SIMS. Now double click the blue SIMS Icon to load SIMS - and don't forget to send biscuits to your friendly IT dept :)"