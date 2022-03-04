@echo off
for /f "tokens=*" %%s in (%cd%\resources_all.txt) do (
  docker run -d --rm alpine/bombardier -c 1000 -d 60000h -l %%s
)
pause
