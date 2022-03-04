@echo off
set _cmd="docker ps -a -q --filter ancestor=alpine/bombardier --format={{.ID}}"
for /f "tokens=*" %%s in ('%_cmd%') do (
  docker stop %%s
)
echo All docker containers stopped.
pause