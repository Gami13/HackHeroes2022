@echo off
:start
START /w /B npm run dev
echo "Gami to furas"
timeout 5 > NUL
goto start
