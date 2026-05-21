#!/bin/bash

# Script automatizado para subir inspectionflow-engine a GitHub
# Uso: bash upload-to-github.sh

set -e  # Salir si hay error

echo "=================================================="
echo "InspectionFlow Engine - GitHub Upload Script"
echo "=================================================="
echo ""

# Colores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Función para imprimir con color
print_step() {
    echo -e "${GREEN}✓ $1${NC}"
}

print_error() {
    echo -e "${RED}✗ $1${NC}"
}

print_info() {
    echo -e "${YELLOW}ℹ $1${NC}"
}

# PASO 1: Verificar que Git está instalado
echo ""
print_info "Verificando Git..."
if ! command -v git &> /dev/null; then
    print_error "Git no está instalado"
    echo "Descargalo desde: https://git-scm.com/download"
    exit 1
fi
print_step "Git está instalado: $(git --version)"

# PASO 2: Verificar configuración de Git
echo ""
print_info "Verificando configuración de Git..."
git_user=$(git config --global user.name)
git_email=$(git config --global user.email)

if [ -z "$git_user" ] || [ -z "$git_email" ]; then
    print_info "Git no configurado. Configurando ahora..."
    read -p "¿Tu nombre completo? " git_user
    read -p "¿Tu email (el de GitHub)? " git_email
    
    git config --global user.name "$git_user"
    git config --global user.email "$git_email"
    print_step "Git configurado"
else
    print_step "Git configurado como: $git_user <$git_email>"
fi

# PASO 3: Pedir ubicación del repositorio
echo ""
print_info "Ubicación del repositorio"
read -p "¿Ruta a tu carpeta inspectionflow-engine? (ej: ~/proyectos/inspectionflow-engine): " repo_path

# Expandir ~ si es necesario
repo_path="${repo_path/#\~/$HOME}"

if [ ! -d "$repo_path" ]; then
    print_error "Carpeta no existe: $repo_path"
    exit 1
fi

print_step "Carpeta encontrada: $repo_path"

# PASO 4: Ir a la carpeta
cd "$repo_path"
print_step "Entrando a: $(pwd)"

# PASO 5: Verificar que es un repositorio git
echo ""
print_info "Verificando que es un repositorio Git..."
if [ ! -d ".git" ]; then
    print_error "No es un repositorio Git"
    print_info "Inicializando como repositorio..."
    git init
    git remote add origin https://github.com/MAXIMILIANOGROSS/inspectionflow-engine.git
fi
print_step "Es un repositorio Git"

# PASO 6: Verificar remoto
print_info "Remoto actual:"
git remote -v

# PASO 7: Ver cambios pendientes
echo ""
print_info "Archivos a subir:"
git status

# PASO 8: Pedir confirmación
echo ""
read -p "¿Deseas continuar y subir estos archivos a GitHub? (s/n): " confirm

if [[ ! "$confirm" =~ ^[Ss]$ ]]; then
    print_error "Cancelado por el usuario"
    exit 1
fi

# PASO 9: Agregar archivos
echo ""
print_info "Agregando archivos..."
git add .
print_step "Archivos agregados"

# PASO 10: Crear commit
echo ""
print_info "Creando commit..."
commit_msg="feat: Initial InspectionFlow Engine implementation

- Core inspection workflow management
- Measurement tracking and validation
- Quality rules engine
- Report generation (JSON, HTML, CSV)
- Comprehensive test suite
- Professional documentation
- CI/CD configuration

Ready for PyPI publication."

git commit -m "$commit_msg"
print_step "Commit creado"

# PASO 11: Push a GitHub
echo ""
print_info "Enviando a GitHub..."
print_info "Si pide autenticación, usa tu token de GitHub como contraseña"
print_info "Genera un token aquí: https://github.com/settings/tokens"
echo ""

if git push origin main; then
    print_step "¡Archivos enviados a GitHub!"
else
    # Podría fallar si no hay conexión
    print_error "Error al enviar a GitHub"
    echo "Posibles soluciones:"
    echo "1. Verifica tu conexión a internet"
    echo "2. Verifica tu usuario de GitHub"
    echo "3. Genera un token en: https://github.com/settings/tokens"
    echo "4. Intenta manualmente: git push origin main"
    exit 1
fi

# PASO 12: Verificar en GitHub
echo ""
print_step "¡COMPLETADO!"
echo ""
echo "Tu proyecto está en GitHub:"
echo "  https://github.com/MAXIMILIANOGROSS/inspectionflow-engine"
echo ""
echo "Próximos pasos:"
echo "  1. Visita tu repositorio en GitHub"
echo "  2. Crea una Release (v0.1.0)"
echo "  3. Publica en PyPI"
echo ""
echo "Ver: 02-GUIA_COMPLETA.md para pasos siguientes"
