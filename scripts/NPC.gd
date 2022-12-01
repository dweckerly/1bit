extends StaticBody2D

onready var npc_animation_player = $AnimationPlayer
onready var npc_sprite = $Sprite
onready var dialogue_prompt = $"dialogue-prompt"
onready var prompt_animplayer = $"prompt-animplayer"

var in_speaking_range = false

func _ready():
	npc_animation_player.play("Idle")
	dialogue_prompt.hide()

func _on_Area2D_body_entered(body):
	if body.name == "Player":
		in_speaking_range = true
		prompt_animplayer.play("prompt-idle")
		dialogue_prompt.show()

func _on_Area2D_body_exited(body):
	if body.name == "Player":
		in_speaking_range = false
		dialogue_prompt.hide()
		Dialogue.end_dialogue()

func _process(_delta):
	if Input.is_action_just_released("ui_accept"):
		if in_speaking_range:
			Dialogue.show_dialogue(name)
			face_player()
		

func face_player():
	if Global.player.position.x > position.x:
		npc_sprite.flip_h = true
	else:
		npc_sprite.flip_h = false
