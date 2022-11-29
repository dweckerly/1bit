extends StaticBody2D

onready var animation_player = $AnimationPlayer

var in_speaking_range = false

func _ready():
	animation_player.play("Idle")

func _on_Area2D_body_entered(body):
	if body.name == "Player":
		in_speaking_range = true
		print("in range to speak to NPC")


func _on_Area2D_body_exited(body):
	if body.name == "Player":
		in_speaking_range = false
		print("out of range to speak to NPC")
