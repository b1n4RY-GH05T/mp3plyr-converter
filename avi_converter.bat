@echo off
:: Path to FFmpeg
set "FFMPEG_PATH=path_here"

:: Check if a file was dropped onto the script
if "%~1"=="" (
    echo Error: Please drag and drop a video file onto this script!
    pause
    exit /b
)

echo Converting: %~nx1...

:: Convert to the working Anko JLR-80852 video format
"%FFMPEG_PATH%" -i "%~1" -vf "scale=-2:128,crop=160:128,transpose=2,vflip" -r 16 -acodec pcm_s16le -ac 2 -ar 22050 -pix_fmt yuvj420p -c:v mjpeg -q:v 2 "%~dpn1_kmart.avi" -y

if errorlevel 1 (
    echo.
    echo Conversion failed! Check the error messages above.
    pause
    exit /b
)

echo.
echo Done! Your converted file is saved as:
echo "%~dpn1_kmart.avi"
pause