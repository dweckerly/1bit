extends Node

const NORTH_SOUTH_OFFSET = 220
const EAST_WEST_OFFSET = 300

func change_scene(area, position, h_flip):
	var path = ""
	var player_position = Vector2.ZERO
	
	if area == "0-South":
		path = "res://scenes/world/area-1.tscn"
		player_position = Vector2(position.x, position.y - NORTH_SOUTH_OFFSET)
	elif area == "0-West":
		path = "res://scenes/world/area-3.tscn"
		player_position = Vector2(position.x + EAST_WEST_OFFSET, position.y)
	elif area == "1-North":
		path = "res://scenes/world/area-0.tscn"
		player_position = Vector2(position.x, position.y + NORTH_SOUTH_OFFSET)
	elif area == "1-East":
		path = "res://scenes/world/area-2.tscn"
		player_position = Vector2(position.x - EAST_WEST_OFFSET, position.y)
	elif area == "2-East":
		path = "res://scenes/world/area-4.tscn"
		player_position = Vector2(position.x - EAST_WEST_OFFSET, position.y)
	elif area == "2-West":
		path = "res://scenes/world/area-1.tscn"
		player_position = Vector2(position.x + EAST_WEST_OFFSET, position.y)
	elif area == "3-East":
		path = "res://scenes/world/area-0.tscn"
		player_position = Vector2(position.x - EAST_WEST_OFFSET, position.y)
	elif area == "4-West":
		path = "res://scenes/world/area-2.tscn"
		player_position = Vector2(position.x + EAST_WEST_OFFSET, position.y)
	elif area == "4-North":
		path = "res://scenes/world/area-5.tscn"
		player_position = Vector2(position.x, position.y + NORTH_SOUTH_OFFSET)
	elif area == "5-South":
		path = "res://scenes/world/area-4.tscn"
		player_position = Vector2(position.x, position.y - NORTH_SOUTH_OFFSET)
	else:
		path = "res://scenes/world/area-0.tscn"
		player_position = Vector2(160, 90)
	
	Global.goto_scene(path, player_position, h_flip)
