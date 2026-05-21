# 🚀 GITHUB EN 3 PASOS (ULTRA SIMPLE)

## ANTES QUE NADA

Tienes UN repositorio vacío aquí:
```
https://github.com/MAXIMILIANOGROSS/inspectionflow-engine
```

Necesitas llenarlo con todos los archivos que creé.

---

## OPCIÓN RECOMENDADA: Automático (Windows o Mac/Linux)

### Windows
1. Descarga: `upload-to-github.bat`
2. Haz doble click
3. Sigue las preguntas
4. **LISTO**

### Mac/Linux
1. Descarga: `upload-to-github.sh`
2. Ejecuta en terminal:
   ```bash
   bash upload-to-github.sh
   ```
3. Sigue las preguntas
4. **LISTO**

---

## OPCIÓN MANUAL (Si el script no funciona)

### PASO 1: Configura Git (Una sola vez)

Abre terminal/CMD y ejecuta:

```bash
git config --global user.name "Tu Nombre"
git config --global user.email "tu_email@gmail.com"
```

Ejemplo:
```bash
git config --global user.name "Maximiliano Gross"
git config --global user.email "maxi@example.com"
```

### PASO 2: Clona tu repositorio vacío

```bash
# Crea una carpeta donde quieras
mkdir ~/proyectos
cd ~/proyectos

# Clona tu repo
git clone https://github.com/MAXIMILIANOGROSS/inspectionflow-engine.git

# Entra a la carpeta
cd inspectionflow-engine
```

### PASO 3: Copia los archivos

Aquí tienes dos opciones:

#### Opción A: GitHub Desktop (Más fácil)
1. Descarga: https://desktop.github.com/
2. Instala y abre
3. Logueate con tu cuenta GitHub
4. Busca "inspectionflow-engine"
5. Click "Clone"
6. Espera a que termine
7. Abre la carpeta en tu computadora
8. Copia todos los archivos que descargaste aquí a esa carpeta
9. GitHub Desktop los verá automáticamente
10. Click "Commit to main"
11. Click "Push origin"
12. **LISTO**

#### Opción B: Terminal (Más rápido si sabes)
```bash
# Si descargaste los archivos, copialos a la carpeta
cp -r ~/Downloads/inspectionflow-engine/* ~/proyectos/inspectionflow-engine/

# O si los tienes en otra ubicación:
cp -r /ruta/a/archivos/* ~/proyectos/inspectionflow-engine/
```

### PASO 4: Sube los cambios

```bash
cd ~/proyectos/inspectionflow-engine

# Agregar todos los archivos
git add .

# Guardar cambios (commit)
git commit -m "feat: Initial InspectionFlow Engine implementation"

# Enviar a GitHub
git push origin main
```

**Si pide contraseña:**
- Usuario: MAXIMILIANOGROSS
- Contraseña: Tu **token de GitHub** (NO tu contraseña)

Para generar token:
1. Ir a: https://github.com/settings/tokens
2. Click "Generate new token"
3. Seleccionar: repo, workflow
4. Click "Generate"
5. COPIAR el token
6. Usarlo como contraseña

---

## ✅ VERIFICACIÓN

Después de subir, ve a:
```
https://github.com/MAXIMILIANOGROSS/inspectionflow-engine
```

Deberías ver:
- ✅ Carpeta `src/` 
- ✅ Carpeta `tests/`
- ✅ Archivo `README.md`
- ✅ Archivo `setup.py`
- ✅ Otros archivos

Si lo ves, ¡**ÉXITO!**

---

## 🆘 SI ALGO FALLA

### Error: "fatal: destination path already exists"
```bash
# Borra la carpeta que clonaste e intenta de nuevo
rm -rf ~/proyectos/inspectionflow-engine
git clone https://github.com/MAXIMILIANOGROSS/inspectionflow-engine.git
```

### Error: "Permission denied"
- Genera un token en: https://github.com/settings/tokens
- Úsalo como contraseña (no tu contraseña real)

### Error: "fatal: not a git repository"
```bash
# Asegúrate de estar en la carpeta correcta
cd ~/proyectos/inspectionflow-engine
git status
```

### Error: "fatal: 'origin' does not appear to be a 'git' repository"
```bash
# Agrega el remote manualmente
git remote add origin https://github.com/MAXIMILIANOGROSS/inspectionflow-engine.git
git push origin main
```

---

## 📋 RESUMEN

| Opción | Tiempo | Dificultad | Recomendado |
|--------|--------|-----------|------------|
| Script Automático | 2 min | Muy fácil | ⭐⭐⭐ |
| GitHub Desktop | 5 min | Fácil | ⭐⭐ |
| Terminal Manual | 10 min | Medio | ⭐ |

---

**Después de subir a GitHub, los próximos pasos son:**
1. Crear una Release (v0.1.0)
2. Publicar en PyPI

Ver: **02-GUIA_COMPLETA.md**
