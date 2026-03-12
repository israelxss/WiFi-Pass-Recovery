@echo off
setlocal DisableDelayedExpansion

:: --- Automatic Admin Elevation ---
net session >nul 2>&1
if %errorLevel% neq 0 (
    powershell -Command "Start-Process -FilePath '%0' -Verb RunAs"
    exit /b
)

:: --- Window Resizing ---
:: Sets the window to 110 columns wide and 40 lines tall
mode con: cols=110 lines=40
:: Sets the internal buffer to 1000 lines so you can scroll up
powershell -command "&{$H=Get-Host;$W=$H.UI.RawUI;$B=$W.BufferSize;$B.Height=1000;$W.BufferSize=$B;}"

title WiFi Password Recovery Tool Professional
color 0B

echo.
echo  =====================================================================================================
echo     WI-FI SAVED PASSWORDS AND NETWORK CONFIGURATION
echo  =====================================================================================================
echo   %-30s ^| %-25s ^| %-15s ^| %-10s
echo   NETWORK NAME                   ^| PASSWORD                  ^| AUTH            ^| CIPHER
echo  -----------------------------------------------------------------------------------------------------

:: --- Main Loop ---
for /f "tokens=4,*" %%i in ('netsh wlan show profiles ^| findstr /C:"All User Profile"') do (
    set "ssid=%%j"
    
    set "pass="
    set "auth="
    set "cipher="

    for /f "tokens=2 delims=:" %%p in ('netsh wlan show profile name^="%%j" key^=clear ^| findstr /C:"Key Content"') do (
        set "pass=%%p"
    )
    for /f "tokens=2 delims=:" %%a in ('netsh wlan show profile name^="%%j" ^| findstr /C:"Authentication"') do (
        set "auth=%%a"
    )
    for /f "tokens=2 delims=:" %%c in ('netsh wlan show profile name^="%%j" ^| findstr /C:"Cipher"') do (
        set "cipher=%%c"
    )

    call :PrintLine "%%j"
)

echo  -----------------------------------------------------------------------------------------------------
echo  [SUCCESS] Total scan finished.
echo.
pause
exit /b

:PrintLine
setlocal EnabledelayedExpansion
set "name=%~1"

:: Clean up leading spaces
if "!name:~0,1!"==" " set "name=!name:~1!"
if "!pass:~0,1!"==" " set "pass=!pass:~1!"
if "!auth:~0,1!"==" " set "auth=!auth:~1!"
if "!cipher:~0,1!"==" " set "cipher=!cipher=!

:: Format if open network
if "!pass!"=="" set "pass=[OPEN / NO KEY]"

:: Create dynamic padding for wide columns
set "col1=!name!                               "
set "col2=!pass!                          "
set "col3=!auth!                "

echo   !col1:~0,30! ^| !col2:~0,25! ^| !col3:~0,15! ^| !cipher!
endlocal
goto :eof