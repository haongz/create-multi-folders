@echo off
setlocal EnableDelayedExpansion

set "script_folder=%~dp0"
set "folder_list=!script_folder!folder-list.txt"
set "result_folder=!script_folder!result"

if not exist "!folder_list!" (
    echo File "folder-list.txt" not found.
    echo Full path: "!folder_list!"
    pause
    exit /b
)

if not exist "!result_folder!" (
    mkdir "!result_folder!"
)

pushd "!result_folder!"

for /f "usebackq delims=" %%i in ("!folder_list!") do (
    mkdir "%%i"
)

popd

echo Folders created successfully!
pause
