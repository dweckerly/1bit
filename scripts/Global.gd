extends Node

var start_game = false

var playerScene = load("res://scenes/Player.tscn")
var player = playerScene.instance()

var current_scene = null

func _ready():
	var root = get_tree().root
	current_scene = root.get_child(root.get_child_count() - 1)

func goto_scene(path, player_position):
	call_deferred("_deferred_goto_scene", path, player_position)
	
func _deferred_goto_scene(path, player_position):
	current_scene.free()
	var s = ResourceLoader.load(path)
	current_scene = s.instance()
	get_tree().root.add_child(current_scene)
	get_tree().current_scene = current_scene
	load_player(player_position)

func load_player(player_position):
	var player_scene = load("res://scenes/Player.tscn")
	var player = player_scene.instance()
	get_tree().current_scene.add_child(player)
	player.set_position(Vector2(player_position))
