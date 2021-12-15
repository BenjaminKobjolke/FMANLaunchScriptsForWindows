@echo off
setlocal enabledelayedexpansion

set argCount=0
for %%x in (%*) do (
	set /A argCount+=1
	set "argVec[!argCount!]=%%~x"
)

echo Number of arguments to process: %argCount%

for /L %%i in (1,1,%argCount%) do (	
	REM !argVec[%%i] will either contain all the files or it will be just the directory,
	REM if no files were selected
	echo %%i- "!argVec[%%i]!"
	REM add your command here
)

pause