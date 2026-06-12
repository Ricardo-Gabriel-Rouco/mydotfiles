---------------------
---- PERMISSIONS ----
---------------------
hl.config({
	ecosystem = {
		enforce_permissions = true,
	},
})

hl.permission({ binary = "/usr/(bin|local/bin)/hyprlock", type = "screencopy", mode = "allow" })
hl.permission({ binary = "/usr/(bin|local/bin)/hyprshot", type = "screencopy", mode = "allow" })
hl.permission({ binary = "/usr/(bin|local/bin)/hyprpicker", type = "screencopy", mode = "allow" })
