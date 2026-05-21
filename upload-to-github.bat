@echo off
REM Script para subir inspectionflow-engine a GitHub en Windows
REM Uso: upload-to-github.bat

setlocal enabledelayedexpansion

cls
echo ==================================================
echo InspectionFlow Engine - GitHub Upload Script
echo ==================================================
echo.

REM PASO 1: Verificar Git
echo Verificando Git...
git --version >nul 2>&1
if errorlevel 1 (
    echo X Git no esta instalado
    echo Descargalo desde: https://git-scm.com/download/win
    pause
    exit /b 1
)
for /f "tokens=*" %%i in ('git --version') do set GIT_VERSION=%%i
echo ^✓ %GIT_VERSION%

REM PASO 2: Verificar configuracion de Git
echo.
echo Verificando configuracion de Git...
for /f "tokens=*" %%i in ('git config --global user.name') do set GIT_USER=%%i
for /f "tokens=*" %%i in ('git config --global user.email') do set GIT_EMAIL=%%i

if "%GIT_USER%"=="" (
    echo Git no esta configurado
    set /p GIT_USER="Tu nombre completo? "
    git config --global user.name "%GIT_USER%"
)
if "%GIT_EMAIL%"=="" (
    set /p GIT_EMAIL="Tu email de GitHub? "
    git config --global user.email "%GIT_EMAIL%"
)
echo ^✓ Configurado como: %GIT_USER% ^<%GIT_EMAIL%^>

REM PASO 3: Pedir ubicacion del repo
echo.
echo Ubicacion del repositorio
set /p REPO_PATH="Ruta a tu carpeta inspectionflow-engine (ej: C:\Users\Tu_Usuario\Documents\inspectionflow-engine): "

if not exist "%REPO_PATH%" (
    echo X Carpeta no existe: %REPO_PATH%
    pause
    exit /b 1
)

echo ^✓ Carpeta encontrada: %REPO_PATH%

REM PASO 4: Ir a la carpeta
cd /d "%REPO_PATH%"
echo ^✓ Entrando a: %CD%

REM PASO 5: Verificar que es repositorio Git
echo.
echo Verificando que es un repositorio Git...
if not exist ".git" (
    echo Inicializando como repositorio Git...
    git init
    git remote add origin https://github.com/MAXIMILIANOGROSS/inspectionflow-engine.git
)
echo ^✓ Es un repositorio Git

REM PASO 6: Ver status
echo.
echo Archivos a subir:
git status

REM PASO 7: Confirmacion
echo.
set /p CONFIRM="Deseas continuar y subir a GitHub? (s/n): "
if /i not "%CONFIRM%"=="s" (
    echo Cancelado por el usuario
    exit /b 1
)

REM PASO 8: Agregar archivos
echo.
echo Agregando archivos...
git add .
echo ^✓ Archivos agregados

REM PASO 9: Crear commit
echo.
echo Creando commit...
git commit -m "feat: Initial InspectionFlow Engine implementation - Core inspection workflow management - Measurement tracking and validation - Quality rules engine - Report generation (JSON, HTML, CSV) - Comprehensive test suite - Professional documentation - CI/CD configuration - Ready for PyPI publication"
if errorlevel 1 (
    echo X Error al crear commit
    pause
    exit /b 1
)
echo ^✓ Commit creado

REM PASO 10: Push a GitHub
echo.
echo Enviando a GitHub...
echo Si pide autenticacion, usa tu token de GitHub como contraseña
echo Genera un token aqui: https://github.com/settings/tokens
echo.

git push origin main
if errorlevel 1 (
    echo X Error al enviar a GitHub
    echo Posibles soluciones:
    echo 1. Verifica tu conexion a internet
    echo 2. Verifica tu usuario de GitHub
    echo 3. Genera un token en: https://github.com/settings/tokens
    echo 4. Intenta manualmente: git push origin main
    pause
    exit /b 1
)

echo ^✓ Archivos enviados a GitHub!

REM PASO 11: Mostrar resultado
echo.
echo ==================================================
echo ¡COMPLETADO!
echo ==================================================
echo.
echo Tu proyecto esta en GitHub:
echo   https://github.com/MAXIMILIANOGROSS/inspectionflow-engine
echo.
echo Proximos pasos:
echo   1. Visita tu repositorio en GitHub
echo   2. Crea una Release (v0.1.0)
echo   3. Publica en PyPI
echo.
echo Ver: 02-GUIA_COMPLETA.md para pasos siguientes
echo.
pause
