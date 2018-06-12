@echo off
setlocal enableDelayedExpansion
for /l %%N in (1800 -1 1) do (
  set /a "min=%%N/60, sec=%%N%%60, n-=1"
  if !sec! lss 10 set sec=0!sec!
  cls
  choice /c:CN1 /n /m "Standby in !min!:!sec! - Press N to Standby Now, or C to Cancel. " /t:1 /d:1
  if not errorlevel 3 goto :break
)
cls
echo Standby in 0:00 - Press N to Standby Now, or C to Cancel.
:break
if errorlevel 2 (rundll32.exe powrprof.dll,SetSuspendState 0,1,0) else echo Standby Canceled