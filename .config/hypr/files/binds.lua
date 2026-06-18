------------
--Keybinds--
------------

--tools keybinds--

hl.bind(MainMod .. " + T", hl.dsp.exec_cmd(Terminal))
hl.bind(MainMod .. " + C", hl.dsp.window.close())
hl.bind(MainMod .. " + SHIFT + Q", hl.dsp.exec_cmd("hyprshutdown"))
hl.bind(MainMod .. " + SHIFT + L", hl.dsp.exec_cmd("hyprlock"))
hl.bind(MainMod .. " + E", hl.dsp.exec_cmd(Eusttaquio))
hl.bind(MainMod .. " + F", hl.dsp.window.float({ action = "toggle" }))
hl.bind(MainMod .. " + R", hl.dsp.exec_cmd(Menu))
hl.bind(MainMod .. " + W", hl.dsp.exec_cmd(Web))
hl.bind(MainMod .. " + SPACE", hl.dsp.exec_cmd(Launcher))
hl.bind(MainMod .. " + S", hl.dsp.exec_cmd(Tools))

--focus keybinds--
hl.bind(MainMod .. " + h", hl.dsp.focus({ direction = "left" }))
hl.bind(MainMod .. " + l", hl.dsp.focus({ direction = "right" }))
hl.bind(MainMod .. " + k", hl.dsp.focus({ direction = "up" }))
hl.bind(MainMod .. " + j", hl.dsp.focus({ direction = "down" }))

-- switch workspace keybinds --
-- Move active window to a workspace with MainMod + SHIFT + [0-9]
for i = 1, 10 do
	local key = i % 10 -- 10 maps to key 0
	hl.bind(MainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(MainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end
hl.bind(MainMod .. " + COMMA", hl.dsp.focus({ workspace = "e-1" }))
hl.bind(MainMod .. " + PERIOD", hl.dsp.focus({ workspace = "e+1" }))

-- special workspaces --
hl.bind(MainMod .. " + B", hl.dsp.workspace.toggle_special("pomodoro"))
hl.bind(MainMod .. " + M", hl.dsp.workspace.toggle_special("musica"))
hl.bind(MainMod .. " + N", hl.dsp.workspace.toggle_special("notes"))
hl.bind(MainMod .. " + SHIFT + B", hl.dsp.window.move({ workspace = SpecialPomodoro }))
hl.bind(MainMod .. " + SHIFT + M", hl.dsp.window.move({ workspace = SpecialMusica }))
hl.bind(MainMod .. " + SHIFT + N", hl.dsp.window.move({ workspace = SpecialNotes }))

-- move windows and resize keybinds --
hl.bind(MainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(MainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- screenshot keybinds --
hl.bind(MainMod .. " + PRINT", function()
	hl.exec_cmd("hyprshot -m window -o" .. HyprshotDir)
end)
hl.bind("PRINT", function()
	hl.exec_cmd("hyprshot -m output -o" .. HyprshotDir)
end)
hl.bind("SHIFT + PRINT", function()
	hl.exec_cmd("hyprshot -m region -o" .. HyprshotDir)
end)

-- clipboard --
hl.bind(MainMod .. " + V", function()
	hl.exec_cmd("cliphist list | rofi -dmenu -theme ~/.config/rofi/cyberpunk.rasi | cliphist decode | wl-copy")
end)

-- special keybinds --
hl.bind("ALT + COMMA", function()
	hl.exec_cmd([[wtype "<"]])
end)
hl.bind("ALT + PERIOD", function()
	hl.exec_cmd([[wtype ">"]])
end)

-- music keybinds --
hl.bind("F1", function()
	hl.exec_cmd([[rmpc remote keybind "<"]])
end)
hl.bind("F2", function()
	hl.exec_cmd([[rmpc remote keybind ">"]])
end)
hl.bind("F3", function()
	hl.exec_cmd(Home .. ".config/rmpc/notify-pause.sh")
end)
hl.bind("F4", function()
	Volume_down()
end)
hl.bind("F5", function()
	Volume_up()
end)
hl.bind("F6", function()
	hl.exec_cmd(Home .. ".config/rmpc/notify-stop.sh")
end)
hl.bind("F9", function()
	hl.exec_cmd(Home .. "Documentos/programacion/jarvis-like/asistente.sh")
end)
