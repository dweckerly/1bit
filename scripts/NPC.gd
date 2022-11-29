extends StaticBody2D

onready var animation_player = $AnimationPlayer
onready var dialogue_box = $"dialogue-box"

var in_speaking_range = false
var is_speaking = false

func _ready():
	animation_player.play("Idle")

func _on_Area2D_body_entered(body):
	if body.name == "Player":
		in_speaking_range = true
		print("in range to speak to NPC")

func _on_Area2D_body_exited(body):
	if body.name == "Player":
		in_speaking_range = false
		is_speaking = false
		dialogue_box.hide()
		print("out of range to speak to NPC")

func _process(delta):
	if Input.is_action_pressed("ui_accept"):
		if in_speaking_range and !is_speaking:
			is_speaking = true
			dialogue_box.show()
