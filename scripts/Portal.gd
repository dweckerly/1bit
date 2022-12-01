extends Area2D

func _on_Area2D_body_entered(body):
	if body.name == "Player":
		Transitions.change_scene(name, body.position, body.sprite.flip_h)
