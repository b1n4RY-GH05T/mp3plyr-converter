@echo off
setlocal EnableExtensions

title AVI Batch Splitter

where ffmpeg >nul 2>&1
if errorlevel 1 (
    echo ERROR: FFmpeg was not found in PATH.
    echo Install FFmpeg or add it to your PATH.
    pause
    exit /b 1
)

echo ========================================
echo          AVI Batch Splitter
echo ========================================
echo.
echo Enter or drag in one AVI file path per line.
echo Type DONE when you have added all your files.
echo.

:input_loop
set "input="
set /p "input=AVI file (or DONE): "

if not defined input goto input_loop
if /i "%input%"=="DONE" goto finished

rem Remove quotation marks added by drag-and-drop
set "input=%input:"=%"

if not exist "%input%" (
    echo ERROR: File not found: "%input%"
    echo.
    goto input_loop
)

for %%F in ("%input%") do (
    set "extension=%%~xF"
)

if /i not "%extension%"==".avi" (
    echo ERROR: Please select an AVI file.
    echo.
    goto input_loop
)

rem Output folder uses the original filename without .avi
for %%F in ("%input%") do set "outdir=%%~dpnF"

if not exist "%outdir%" mkdir "%outdir%"

echo.
echo Processing: "%input%"
echo Output folder: "%outdir%"
echo.

ffmpeg -hide_banner -y -i "%input%" ^
    -map 0:v? -map 0:a? ^
    -c copy ^
    -f segment ^
    -segment_time 180 ^
    -reset_timestamps 1 ^
    -segment_format avi ^
    "%outdir%\part_%%03d.avi"

if errorlevel 1 (
    echo ERROR: Failed to process "%input%".
) else (
    echo SUCCESS: Finished "%input%".
)

echo.
goto input_loop

:finished
echo.
echo All requested files have been processed.
pause
