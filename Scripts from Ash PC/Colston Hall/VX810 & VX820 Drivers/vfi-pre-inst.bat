@echo off

SET VfiDc=devcon.exe
SET VfiDiFx=DIFxCmd32.exe
SET Msg1=Win-Xp Installation
SET Msg2=Pre-Installing driver for 32-bit OS using 32-bit installer
SET VfiCertPath=.\TestCert\certmgrx86
SET Vx-OS=Vx-Xp
SET PP-OS=PP-Xp

rem find OS is XP or 7
wmic OS Get Version | find "6.1" > nul
if %ERRORLEVEL% == 0 (
	set Msg1=Win-7 Installation
	set Vx-OS=Vx-7
	set Vx-OS=Vx-7
)

rem main function
echo %Msg1%
call:VfiProcArchDetect
call:VfiDriverInstall %Vx-OS% %PP-OS%
goto:eof

rem function  - to detect the processor architecture and set variables
:VfiProcArchDetect
IF /I "%PROCESSOR_ARCHITECTURE%" == "AMD64" (
	SET VfiDc=devcon.exe
	SET VfiDiFx=DIFxCmd64.exe
	SET VfiCertPath=.\TestCert\certmgrx64
	SET Msg2=Pre-Installing driver for Windows 64-bit OS using 64-bit installer
) ELSE IF /I "%PROCESSOR_ARCHITECTURE%" == "X86" (
	IF /I "%PROCESSOR_ARCHITEW6432%" == "AMD64" (
		SET VfiDc=dc64.exe
		SET VfiDiFx=DIFxCmd64.exe
		SET VfiCertPath=.\TestCert\certmgrx64
		SET Msg2=Pre-Installing driver for Windows 64-bit OS using 32-bit installer
	) ELSE (
		rem SET VfiDiFx=DIFxCmd32.exe
		rem SET VfiCertPath=.\TestCert\certmgrx32
		rem SET Msg2=Pre-Installing driver for Windows XP-32 OS using 32-bit installer
	)
)
goto:eof

rem function - which installs driver and test certificates
:VfiDriverInstall
echo %Msg2%
rem %VfiCertPath% -add .\TestCert\vfi.cer -s -r localMachine rootrem V30 Vx XP/7 Certified
rem echo test certificates installed!

%VfiDiFx% /p .\%~1\VFIUSBF.INF 16
rem %VfiDiFx% /p .\%~2\VFIUSBPP.INF 16
%VfiDc% rescan

del %VfiDc%
goto:eof
