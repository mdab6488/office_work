@echo off
setlocal EnableDelayedExpansion

set i=1
for /f "usebackq delims=" %%F in ("names.txt") do (
    set "num=00!i!"
    set "padded=!num:~-3!"
    md "!padded! - %%F"
    set /a i+=1
)

echo Done!
pause
