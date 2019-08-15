@echo off
SETLOCAL ENABLEEXTENSIONS
SET me=%~n0
SET parent=%~dp0
SET PYTHONPATH="E:\coding\Python"
SET JSPATH="E:\coding\Javascript"
SET lang=%1
SET filename=%2
SET fname=%filename:"=%

echo %fname%
IF "%lang%" == "-p" (
    E:
    cd %PYTHONPATH%
    CALL :repo
) ELSE IF "%lang%" == "-j" (
    E:
    cd %JSPATH%
    CALL :repo
)

ENDLOCAL
ECHO ON
@EXIT /B %ERRORLEVEL%

:repo
IF EXIST "%fname%\NUL" (
    ECHO The directory %filename% already exists
) ELSE (
    mkdir %filename%
    python %parent%createRepo.py %filename%
    cd %filename%
    echo #%fname% >> README.md
    git init
    git add README.md
    git commit -m "Initial commit"
    git remote add origin https://github.com/LeoLYW12138/%fname%.git
    git push -u origin master
    echo successfully initialize a repository
)
EXIT /B 0
