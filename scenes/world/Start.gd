extends YSort

func _ready():
	if !Global.start_game:
		add_child(Global.player)
		Global.player.set_position(Vector2(160, 90))
		Global.start_game = true
