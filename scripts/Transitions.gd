extends Node

const NORTH_SOUTH_OFFSET = 155

func change_scene(area, position):
	if area == "0-South":
		Global.goto_scene("res://scenes/world/area-1.tscn", Vector2(position.x, position.y - NORTH_SOUTH_OFFSET))
	elif area == "1-North":
		Global.goto_scene("res://scenes/world/area-0.tscn", Vector2(position.x, position.y + NORTH_SOUTH_OFFSET))
