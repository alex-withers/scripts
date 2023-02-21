@echo off
SET VfiDc=devcon.exe
SET drv="C:\WINDOWS\system32\drivers"
del %drv%\VfiEnum.sys
del %drv%\VfiUsbF.sys"
rem del %drv%\VfiUsbPP.sys"
rem del %drv%\VfiEnmP.sys"

call:VfiProcArchDetect
%VfiDc% remove USB\VID_11CA*
%VfiDc% restart USB\VID_11CA*

:VfiProcArchDetect
IF /I "%PROCESSOR_ARCHITECTURE%" == "AMD64" (
	SET VfiDc=devcon.exe
) ELSE IF /I "%PROCESSOR_ARCHITECTURE%" == "X86" (
	IF /I "%PROCESSOR_ARCHITEW6432%" == "AMD64" (
		SET VfiDc=devcon.exe
	) ELSE (
		rem SET VfiDiFx=DIFxCmd32.exe
		rem SET Msg2=Removing driver for Windows XP-32 OS using 32-bit installer
	)
)
goto:eof