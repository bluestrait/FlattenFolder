@ECHO OFF
REM This batch move all files and subfolders under specified folder to the root folder itself (virtually eliminate the direct children folders)
REM Copyright 2019 Min Huang
SET args=%*
IF NOT DEFINED args GOTO ERROR
ECHO ^>^>^> Folder: %*
REM ECHO ^>^>^> Are you sure you want to move all files/subfolders under this folder up one level? (Press Contrl-C to abort)
REM PAUSE

REM move all children 
for /D  %%i in (%1\*) do move /Y ^"%%i^"\*.* %1\
REM deleting all child folders
for /D  %%i in (%1\*) do rmdir /S /Q ^"%%i^"
REM delete unwanted files (errors supressed by redirecting to null)
del %1\*.exe %1\*.txt %1\*.nfo 2>nul

ECHO ^>^>^> Done.
goto finished

:ERROR
echo ERROR: No arguments were defined!

:finished 
PAUSE
