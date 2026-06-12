-------------
--AUTOSTART--
-------------

hl.on("hyprland.start", function()
	hl.exec_cmd("awww kill 2>/dev/null; sleep 0.3 && awww-daemon")
	hl.exec_cmd("sleep 0.8 && awww img /home/omega/Imágenes/wallpaper.jpg")
	hl.exec_cmd("gsettings set org.gnome.desktop.interface gtk-theme 'catppuccin-mocha-mauve'")
	hl.exec_cmd("gsettings set org.gnome.desktop.interface icon-theme 'Tela-circle-dracula'")
	hl.exec_cmd("gsettings set org.gnome.desktop.interface cursor-theme 'Bibata-Modern-Ice'")
	hl.exec_cmd("waybar &")
	hl.exec_cmd("$HOME/.config/hypr/scripts/waybar_auto_hide")
	hl.exec_cmd("hypridle")
	hl.exec_cmd("dunst")
	hl.exec_cmd("nm-applet --indicator")
	hl.exec_cmd("udiskie --no-automount --smart-tray")
	hl.exec_cmd("wl-paste --type text --watch cliphist store")
	hl.exec_cmd("wl-paste --type image --watch cliphist store")
end)
