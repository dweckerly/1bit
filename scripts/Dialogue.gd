extends Node

const data = preload("res://scripts/data/dialogueVars.gd")

const BOTTOM_POS = Vector2(160, 148)
const TOP_POS = Vector2(160, 32)

var dialogue = preload("res://scenes/ui/dialogue-box.tscn").instance()
var text_node = dialogue.get_child(1)
#var text_node = dialogue.get_node("RichTextLabel")

var active_dialogue = false
var count = 0

func show_dialogue(npc_id):
	
	if !active_dialogue:
		count = 0
		var pos = 'bottom'
		active_dialogue = true
		get_tree().root.add_child(dialogue)
		if pos == 'bottom':
			dialogue.position = BOTTOM_POS
		if pos == 'top':
			dialogue.position = TOP_POS
	play_dialogue(npc_id, count)
	count += 1

func play_dialogue(npc_id, index):
	var text = data.dialogues[npc_id]
	if index < text.size():
		text_node.text = text[index]
	else:
		end_dialogue()
	
	
func end_dialogue():
	if active_dialogue:
		active_dialogue = false
		get_tree().root.remove_child(dialogue)
