extends Node

var start_game = false

var player_scene = load("res://scenes/Player.tscn")
var player = player_scene.instance()
var player_can_move = true

var hud_scene = load("res://scenes/ui/HUD.tscn")
var hud = hud_scene.instance()

var current_scene = null

func _ready():
	var root = get_tree().root
	current_scene = root.get_child(root.get_child_count() - 1)

func goto_scene(path, player_position, h_flip):
	call_deferred("_deferred_goto_scene", path, player_position, h_flip)
	
func _deferred_goto_scene(path, player_position, h_flip):
	current_scene.free()
	var s = ResourceLoader.load(path)
	current_scene = s.instance()
	get_tree().root.add_child(current_scene)
	get_tree().current_scene = current_scene
	load_player(player_position, h_flip)
	load_hud()

func load_player(player_position, h_flip):
	player = player_scene.instance()
	get_tree().current_scene.add_child(player)
	player.set_position(Vector2(player_position))
	player.get_child(0).flip_h = h_flip

func load_hud():
	hud = hud_scene.instance()
	get_tree().current_scene.add_child(hud)
	hud.instantiate_hud()
	
