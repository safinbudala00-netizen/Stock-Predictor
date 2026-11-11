@echo off
setlocal
cd /d "%~dp0"

REM If g++ is not in user PATH, look in standard MinGW / MSYS2 locations
where g++ >nul 2>&1
if errorlevel 1 (
    if exist "C:\msys64\ucrt64\bin\g++.exe" set "PATH=C:\msys64\ucrt64\bin;%PATH%"
    if exist "C:\MinGW\bin\g++.exe" set "PATH=C:\MinGW\bin;%PATH%"
)

cd /d "%~dp0StockPricePredictor"

if not exist "StockPricePredictor.exe" (
    echo ===================================================
    echo  Compiling ALPHA STOCX PRO [Classy GUI Edition]...
    echo ===================================================
    g++ -std=c++17 -Wall -Wextra main.cpp CSVHandler.cpp LinearRegression.cpp MovingAverage.cpp Portfolio.cpp Stock.cpp StockManager.cpp StockGUI.cpp -mwindows -lgdiplus -ldwmapi -o StockPricePredictor.exe
)

if exist "StockPricePredictor.exe" (
    echo ===================================================
    echo  Launching ALPHA STOCX PRO GUI...
    echo ===================================================
    start "" "StockPricePredictor.exe"
) else (
    echo [ERROR] Failed to compile or find StockPricePredictor.exe
    pause
)
