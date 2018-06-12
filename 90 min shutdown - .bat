@ECHO OFF
:myLabel
SHUTDOWN /S /F /T 5400
SET /P continue="Your computer is about to shutdown in 90 min do you want to abort (y/n): "
IF %continue% EQU y (
SHUTDOWN /A
TIMEOUT /T 1800 /NOBREAK
GOTO myLabel
)