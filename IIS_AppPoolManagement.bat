@echo off
cd C:\Windows\system32\inetsrv\
:programTop
set "input="
set /p input= Enter App Pool Name or "List": 
IF /i "%input%"=="List" goto listAllAppPool
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
curl localhost/%input%
goto programStart

:stopAppPool
appcmd stop apppool /apppool.name:"%input%"
goto programStart

:killWP
set pid= 
for /f "delims=" %%a in ('appcmd list wp /apppool.name:"%input%" /text:wp.name') do @set pid=%%a
taskkill /pid %pid% /t /f
goto programStart

:listWP
appcmd list wp /apppool.name:"%input%"
goto programStart

:listAllAppPool
appcmd list apppool
goto programTop

:exitProgram
pause
