extends Node

const BOTTOM_POS = Vector2(160, 148)
const TOP_POS = Vector2(160, 32)

var dialogue_scene = load("res://scenes/ui/dialogue-box.tscn")
var dialogue = dialogue_scene.instance()

func play_dialogue(npc_id):
	print(npc_id)
	var pos = 'bottom'
	get_tree().root.add_child(dialogue)
	if pos == 'bottom':
		dialogue.position = BOTTOM_POS
	if pos == 'top':
		dialogue.position = TOP_POS
	
func end_dialogue():
	get_tree().root.remove_child(dialogue)
