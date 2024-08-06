@echo off

REM Uninstall the EXE Cloud Print Software File
start "" "%~dp0cloudprintscan_kde-prod_1.10.06610.1.exe" -s -uninstall

timeout /t 90 /nobreak >nul

REM Removing the Kyocera Cloud Printer
echo Removing printer "Kyocera Cloud Printer"...

rundll32 printui.dll,PrintUIEntry /dl /n "Kyocera Cloud Printer"

REM Check if the printer was successfully removed
if %errorlevel%==0 (
    echo Printer "Kyocera Cloud Printer" removed successfully.
) else (
    echo Failed to remove printer "Kyocera Cloud Printer".
)

timeout /t 5 /nobreak >nul