# Paquetes necesarios

## Instalar con pacman

```bash
sudo pacman -S --needed hyprland hyprlock hypridle hyprshot hyprsunset \
  waybar rofi dunst wlogout wl-clipboard cliphist awww fastfetch \
  ghostty nautilus vivaldi udiskie nm-applet polkit-kde-agent \
  qt5ct qt6ct kvantum nwg-look sddm mpd mpc rmpc jq
```

## Instalar con yay (AUR)

```bash
yay -S catppuccin-mocha-gtk tela-circle-icon-theme bibata-cursor-theme \
  zsh-autosuggestions zsh-syntax-highlighting \
  nerd-fonts-iosevka-term
```

## Oh My Zsh + Powerlevel10k

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

## Temas locales (cuando no hay sudo)

Si no tenés permisos sudo, instalá manualmente en `~/.local/share/`:

| Componente | Origen |
|---|---|
| Catppuccin-Mocha GTK | https://github.com/catppuccin/gtk/releases |
| Tela-circle-dracula | https://github.com/vinceliuice/Tela-circle-icon-theme |
| Bibata-Modern-Ice | https://github.com/ful1e5/Bibata_Cursor |
| IosevkaTerm Nerd Font | https://github.com/ryanoasis/nerd-fonts/releases |

## Scripts del asistente (`F9`)

`~/Documentos/programacion/jarvis-like/asistente.sh` — requiere Python y dependencias propias del proyecto.
