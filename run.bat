@echo off
setlocal
cd /d "%~dp0"

if not exist "lib\mysql-connector-j-8.0.33.jar" (
    echo MySQL JDBC driver is missing from the lib folder.
    pause
    exit /b 1
)

if not exist "out\production\MiniBookManager" mkdir "out\production\MiniBookManager"

javac --release 17 -encoding UTF-8 -cp "lib/*" -d "out\production\MiniBookManager" ^
    src\Main.java src\Book.java src\DatabaseConnection.java src\BookRepository.java src\BookManagerApp.java
if errorlevel 1 (
    echo Compilation failed.
    pause
    exit /b 1
)

java -cp "out\production\MiniBookManager;lib/*" Main %*
pause
