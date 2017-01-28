@echo off

if (%1)==() goto test_command
if (%1)==(start) goto start
goto endok

:test_command
if (%COMSPEC%)==() goto no_command
%COMSPEC% /E:9217 /C %0 start %1 %2 %3
goto endok

:no_command
echo No Command Interpreter found
goto endok

:start
call clean.bat
computil SetupD7
if exist setenv.bat call setenv.bat
if not exist Source\DCU\*.* md Source\DCU >nul
if exist Source\DCU\*.* call clean.bat Source\DCU\

if (%NDD7%)==() goto enderror
if (%NDWINSYS%)==() goto enderror

REM ***************************************************
%NDD7%\bin\dcc32.exe source\Common\Common.dpk /m /h /w /U -$d-l-n+p+r-s-t-w- %2 %3 %4
REM /Oobjs /m /h /w /N..\D7 /LE..\D7 /LN..\D7 -$d-l-n+p+r-s-t-w- %2 %3 %4

if errorlevel 1 goto enderror

REM ***************************************************
REM Clean-up
REM ***************************************************

goto endok
:enderror
call clean
echo Error!
:endok