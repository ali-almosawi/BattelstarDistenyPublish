@echo off
setlocal enabledelayedexpansion

:: Get the current directory
set "currentDir=%cd%"

:: Define the source folder (wwwroot)
set "sourceDir=%currentDir%\wwwroot"
set "indexFile=%currentDir%\wwwroot\index.html"
set "errorFile=%currentDir%\wwwroot\404.html"

:: Check if the wwwroot folder exists
if exist "%sourceDir%" (
   echo wwwroot folder found. Proceeding with modification and copy...


	
 :: Debugging: Show the full paths for index.html and 404.html
    echo Checking for index.html at: "%indexFile%"
    echo Checking for 404.html at: "%errorFile%"
	
	
	
    :: Check if index.html exists in the wwwroot folder
    if exist "%indexFile%" (
        echo Replacing <base href="/" /> in index.html...
        powershell -Command "(Get-Content '%indexFile%') -replace '<base href=\"/\" />', '<base href=\"BattelstarDistenyPublish\" />' | Set-Content '%indexFile%'"
        echo Replacement completed in index.html.
    ) else (
        echo index.html file not found in %sourceDir%.
    )

    :: Check if 404.html exists in the wwwroot folder
    if exist "%errorFile%" (
          echo Replacing <base href="/" /> in 404.html...
        powershell -Command "(Get-Content '%errorFile%') -replace '<base href=\"/\" />', '<base href=\"BattelstarDistenyPublish\" />' | Set-Content '%errorFile%'"
        echo Replacement completed in 404.html.
    ) else (
        echo 404.html file not found in %sourceDir%.
    )

    :: Now, copy all files and subfolders from wwwroot to the root of the current directory
    echo Copying files from %sourceDir% to %currentDir%...
    xcopy "%sourceDir%\*" "%currentDir%\" /E /H /R /Y >nul
    echo Copy operation completed.

) else (
    echo The folder 'wwwroot' does not exist in the current directory.
)

pause