extends Node

const BOTTOM_POS = Vector2(160, 148)
const TOP_POS = Vector2(160, 32)

const TYPE_SPEED = 0.02

var data = preload("res://scripts/data/dialogueVars.gd")
var dialogue = preload("res://scenes/ui/dialogue-box.tscn").instance()
var text_node = dialogue.get_child(1)
#var text_node = dialogue.get_node("RichTextLabel")

var active_dialogue = false
var typing = false
var count = -1

func show_dialogue(npc_id):
	text_node.text = ""
	if !active_dialogue:
		count = -1
		var pos = 'bottom'
		active_dialogue = true
		get_tree().root.add_child(dialogue)
		if pos == 'bottom':
			dialogue.position = BOTTOM_POS
		if pos == 'top':
			dialogue.position = TOP_POS
	if !typing:
		count += 1
	play_dialogue(npc_id)

func play_dialogue(npc_id):
	var text = data.dialogues[npc_id]
	if count < text.size():
		if typing:
			typing = false
			type_text(text[count])
		else:
			typing = true
			type_text(text[count])
	else:
		end_dialogue()

func type_text(text):
	var chars = 0
	while chars < len(text) - 1 and typing:
		yield(get_tree().create_timer(TYPE_SPEED), "timeout")
		if typing:
			text_node.text += text[chars]
			chars += 1
	text_node.text = text
	typing = false

func end_dialogue():
	if active_dialogue:
		active_dialogue = false
		typing = false
		get_tree().root.call_deferred("remove_child", dialogue)
