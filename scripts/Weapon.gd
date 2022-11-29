extends Node2D

onready var sprite = $Sprite
onready var animation_player = $AnimationPlayer

func _ready():
	pass # Replace with function body.

func _physics_process(delta):		
	if Input.is_action_pressed("ui_click"):
		animation_player.play("SwingLeft")
