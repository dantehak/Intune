@echo off

REM Install the EXE Cloud Print Software File
start "" "%~dp0cloudprintscan_kde-prod_1.10.06610.1.exe" -s -on "stageentertainment"

timeout /t 120 /nobreak >nul

REM Removing the default PDF Printer
echo Removing printer "Kyocera Cloud Print and Scan"...

rundll32 printui.dll,PrintUIEntry /dl /n "Kyocera Cloud Print and Scan"

REM Check if the printer was successfully removed
if %errorlevel%==0 (
    echo Printer "Kyocera Cloud Print and Scan" removed successfully.
) else (
    echo Failed to remove printer "Kyocera Cloud Print and Scan".
)

timeout /t 20 /nobreak >nul

REM Installing the correct printer driver
echo Running Print Driver executable...
start "" "%~dp0KCPS_driver_KX.exe"

timeout /t 20 /nobreak >nul
