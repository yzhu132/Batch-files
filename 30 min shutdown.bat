@ECHO OFF
:myLabel
SHUTDOWN /S /F /T 600
SET /P continue="Your computer is about to shutdown in 30 min do you want to abort (y/n): "
IF %continue% EQU y (
SHUTDOWN /A
TIMEOUT /T 1800 /NOBREAK
GOTO myLabel
)