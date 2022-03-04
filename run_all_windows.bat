@echo off

set "resources=%1"
if "%resources%"=="" set "resources=%cd%\resources_all.txt" || set /p "resources=Enter Value: "
@REM echo %resources%

for /f "tokens=*" %%s in (%resources%) do (
  docker run -d --rm alpine/bombardier -c 1000 -d 60000h -l %%s
)

pause

@REM for %%a in (%*) do echo [%%a] was dropped on me 
