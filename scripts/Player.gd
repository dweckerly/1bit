extends KinematicBody2D

const SPEED = 88
const ACCELERATION = 500
const FRICTION = 500

var velocity = Vector2.ZERO

onready var animation_player = $AnimationPlayer
onready var sprite = $Sprite

func _ready():
	pass
	
func set_position(pos):
	position = pos

func _physics_process(delta):
	var input_vector = Vector2.ZERO
	
	if Global.player_can_move:
		input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
		input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
		input_vector = input_vector.normalized()
	
	if input_vector != Vector2.ZERO:
		animation_player.play("Run")
		if input_vector.x > 0:
			sprite.flip_h = true
		elif input_vector.x < 0:
			sprite.flip_h = false
		velocity = velocity.move_toward(input_vector * SPEED, ACCELERATION * delta)
	else:
		animation_player.play("Idle")
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
	
	velocity = move_and_slide(velocity)
