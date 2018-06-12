@ECHO off
setlocal enabledelayedexpansion
set reset=0
FOR /L %%A IN (1, 1, 9999) DO (
echo Checking internet connection...
Ping www.google.ca -n 1 -w 1000
REM cls
if errorlevel 1 (set internet=Not connected to internet) else (set internet=Connected to internet)
echo %internet%
echo.

echo errorlevel: !errorlevel!
if errorlevel 1 (
	echo Restarting Internet stuff
	REM netsh int ip reset reset.txt
	REM netsh winsock reset
	REM netsh advfirewall reset
	netsh interface set interface "Ethernet" DISABLED
	echo Ethernet disabled
	TIMEOUT /t 10
	netsh interface set interface "Ethernet" ENABLED
	echo Ethernet enabled
	TIMEOUT /t 20
	set /a reset+=1
	echo.
	echo ----------------------------------------
) else (
	echo Internet is working fine!
	echo # of resets so far: !reset!
	echo Countup: %%A
	echo.
	echo ----------------------------------------
)

TIMEOUT /t 5
echo.
echo ----------------------------------------
)

pause