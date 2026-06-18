hl.curve("overshoot", { type = "bezier", points = { { 0.61, 1 }, { 0.88, 1 } } })
hl.animation({ leaf = "specialWorkspace", enabled = true, speed = 5, bezier = "overshoot", style = "slidevert" })
