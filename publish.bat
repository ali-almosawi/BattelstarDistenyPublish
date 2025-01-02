@echo off
setlocal enabledelayedexpansion

:: Get the current directory
set "currentDir=%cd%"

:: Define the source folder (wwwroot)
set "sourceDir=%currentDir%\wwwroot"

:: Check if the wwwroot folder exists
if exist "%sourceDir%" (
    echo Copying files from %sourceDir% to %currentDir%...
    :: Copy all files and subfolders from wwwroot to the root of the current directory
    xcopy "%sourceDir%\*" "%currentDir%\" /E /H /R /Y
    echo Copy operation completed.
) else (
    echo The folder 'wwwroot' does not exist in the current directory.
)

pause
