@echo off
setlocal EnableExtensions
title FFmpeg Setup

echo ========================================
echo          FFmpeg Setup Utility
echo ========================================
echo.

:: Check WinGet
where winget >nul 2>&1
if errorlevel 1 (
    echo ERROR: WinGet is not installed or not in PATH.
    goto :error
)

set "FFMPEG="
set "SEARCHDIR=%LOCALAPPDATA%\Microsoft\WinGet\Packages"

echo Checking for an existing FFmpeg installation...
echo.

:: Check FFmpeg available through PATH
for /f "delims=" %%F in ('where ffmpeg.exe 2^>nul') do (
    if not defined FFMPEG (
        "%%F" -version >nul 2>&1
        if not errorlevel 1 set "FFMPEG=%%F"
    )
)

:: Check the usual WinGet links directory
if not defined FFMPEG (
    if exist "%LOCALAPPDATA%\Microsoft\WinGet\Links\ffmpeg.exe" (
        "%LOCALAPPDATA%\Microsoft\WinGet\Links\ffmpeg.exe" -version >nul 2>&1
        if not errorlevel 1 (
            set "FFMPEG=%LOCALAPPDATA%\Microsoft\WinGet\Links\ffmpeg.exe"
        )
    )
)

:: Search WinGet packages for a working executable
if not defined FFMPEG if exist "%SEARCHDIR%" (
    for /r "%SEARCHDIR%" %%F in (ffmpeg.exe) do (
        if not defined FFMPEG (
            "%%F" -version >nul 2>&1
            if not errorlevel 1 set "FFMPEG=%%F"
        )
    )
)

:: Install if no working executable was found
if defined FFMPEG goto :success

echo FFmpeg is not installed or could not be located.
echo Installing from the WinGet repository...
echo.

winget install --id Gyan.FFmpeg --exact --source winget --accept-package-agreements --accept-source-agreements

echo.
echo Checking installation...
echo.

:: Search PATH again
for /f "delims=" %%F in ('where ffmpeg.exe 2^>nul') do (
    if not defined FFMPEG (
        "%%F" -version >nul 2>&1
        if not errorlevel 1 set "FFMPEG=%%F"
    )
)

:: Search WinGet links again
if not defined FFMPEG (
    if exist "%LOCALAPPDATA%\Microsoft\WinGet\Links\ffmpeg.exe" (
        "%LOCALAPPDATA%\Microsoft\WinGet\Links\ffmpeg.exe" -version >nul 2>&1
        if not errorlevel 1 (
            set "FFMPEG=%LOCALAPPDATA%\Microsoft\WinGet\Links\ffmpeg.exe"
        )
    )
)

:: Search installed package directories again
if not defined FFMPEG if exist "%SEARCHDIR%" (
    for /r "%SEARCHDIR%" %%F in (ffmpeg.exe) do (
        if not defined FFMPEG (
            "%%F" -version >nul 2>&1
            if not errorlevel 1 set "FFMPEG=%%F"
        )
    )
)

if not defined FFMPEG (
    echo ERROR: Installation or executable detection failed.
    echo Try running:
    echo winget list --id Gyan.FFmpeg --exact --source winget
    goto :error
)

:success
echo ========================================
echo             FFmpeg is ready
echo ========================================
echo.
echo Executable path:
echo %FFMPEG%
echo.

> "%~dp0ffmpeg_path.txt" echo %FFMPEG%
echo Path saved to:
echo %~dp0ffmpeg_path.txt
echo.
pause
exit /b 0

:error
echo.
echo Setup failed.
echo.
pause
exit /b 1
