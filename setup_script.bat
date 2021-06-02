@echo off
%~d0
CD %~dp0
title %~n0
color F0
echo.
echo @by_Rahman

echo.
call :. Starting_Scripts  

echo.
call :Process Windows_10_activation 
start /wait powershell -executionpolicy remotesigned -file activation.ps1 
call :Completed. 

echo.
call :Process Office_2016_or_2019_activation 
start /wait powershell -executionpolicy remotesigned -file office16or19.ps1 
call :Completed. 

echo.
call :. Completed_Successfully. 

timeout /t 5

exit

:Process
set "name=%~1"
powershell write-host 'Process %name% :' -foregroundcolor green -backgroundcolor black

exit /b

:Completed.
set "name=%~1"
powershell write-host 'Completed. %name% ' -foregroundcolor blue -backgroundcolor black 

exit /b

:.
set "name=%~1"
powershell write-host ' %name% ' -foregroundcolor darkyellow -backgroundcolor black