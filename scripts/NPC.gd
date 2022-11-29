extends StaticBody2D

onready var npc_animation_player = $AnimationPlayer
onready var npc_sprite = $Sprite
onready var dialogue_prompt = $"dialogue-prompt"
onready var prompt_animplayer = $"prompt-animplayer"

var in_speaking_range = false
var is_speaking = false

func _ready():
	npc_animation_player.play("Idle")
	dialogue_prompt.hide()

func _on_Area2D_body_entered(body):
	if body.name == "Player":
		in_speaking_range = true
		prompt_animplayer.play("prompt-idle")
		dialogue_prompt.show()
		print("in range to speak to NPC")

func _on_Area2D_body_exited(body):
	if body.name == "Player":
		in_speaking_range = false
		is_speaking = false
		dialogue_prompt.hide()
		Dialogue.end_dialogue()
		print("out of range to speak to NPC")

func _process(delta):
	if Input.is_action_pressed("ui_accept"):
		if in_speaking_range and !is_speaking:
			is_speaking = true
			Dialogue.play_dialogue(name)
			face_player()

func face_player():
	if Global.player.position.x > position.x:
		npc_sprite.flip_h = true
	else:
		npc_sprite.flip_h = false
