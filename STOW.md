# Usar Stow para gestionar dotfiles

## En la PC nueva

```bash
# 1. Instalar stow
sudo pacman -S stow

# 2. Clonar los dotfiles en ~/dotfiles
git clone https://github.com/tu-usuario/tu-repo.git ~/dotfiles

# 3. Crear los symlinks (archivos sueltos, sin plegar carpetas)
cd ~/dotfiles
stow --no-folding -t ~ .

# 4. Verificar
ls -la ~/.zshrc          # → symlink a ~/dotfiles/.zshrc
ls -la ~/.config/hypr/   # → symlinks individuales
```

## Explicación

| Flag | Significado |
|---|---|
| `--no-folding` | No convierte carpetas existentes (`.config/`) en symlinks — crea symlinks **dentro** de ellas |
| `-t ~` | Target: el directorio donde se crean los symlinks (`$HOME`) |
| `.` | Package: todo lo que hay en `~/dotfiles/` |

## Lo que NO se replica automáticamente

- `~/.config/rmpc/` — ya está en dotfiles, el symlink se crea con stow
- Temas GTK/iconos/cursor — hay que instalarlos por separado (ver `packages.md`)
- `~/Documentos/programacion/jarvis-like/` — scripts externos a los dotfiles

## Para actualizar después de cambiar algo

```bash
cd ~/dotfiles
git add .
git commit -m "cambios"
git push

# En la otra PC:
cd ~/dotfiles && git pull
stow --no-folding -t ~ .
```

## Si hay conflictos con archivos existentes

Stow se rehúsa a sobrescribir. Mové los archivos existentes a un backup:

```bash
mkdir -p ~/dotfiles-backup
mv ~/.config/waybar ~/dotfiles-backup/
mv ~/.zshrc ~/dotfiles-backup/
# luego corré stow de nuevo
```
