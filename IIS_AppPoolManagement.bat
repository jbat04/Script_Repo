@echo off
cd C:\Windows\system32\inetsrv\
echo Batch Script to take input.
set /p input= Enter App Pool Name: 
:programStart
echo Site: %input%
set "select="
set /p select= What Do you want to do: (start/stop/kill/getID/exit): 
echo you entered: %select%
IF /i "%select%"=="start" goto startAppPool
IF /i "%select%"=="stop" goto stopAppPool
IF /i "%select%"=="kill" goto killWP
IF /i "%select%"=="getID" goto listWP
IF /i "%select%"=="exit" goto exitProgram

echo Not found.
goto programStart

:startAppPool
appcmd start apppool /apppool.name:"%input%"
goto programStart

:stopAppPool
appcmd stop apppool /apppool.name:"%input%"
goto programStart

:killWP
appcmd list wp
goto programStart

:listWP
appcmd list wp
goto programStart

:exitProgram
pause