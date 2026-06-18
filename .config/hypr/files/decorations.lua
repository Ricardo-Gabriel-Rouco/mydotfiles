hl.config({
	general = {
		gaps_in = 5,
		gaps_out = 5,

		border_size = 2,
		resize_on_border = true,
		allow_tearing = true,
		layout = "dwindle",
	},
	decoration = {
		active_opacity = 1.0,
		inactive_opacity = 0.9,
		blur = {
			enabled = true,
			size = 3,
			passes = 1,
			vibrancy = 0.1696,
		},
		shadow = {
			enabled = true,
			range = 4,
			render_power = 3,
			color = 0xee1a1a1a,
		},
	},
})
