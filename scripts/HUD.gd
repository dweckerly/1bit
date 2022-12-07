extends Control

const HEART_OFFSET = 10

onready var heart_container

var hearts = 0
var heart_scene = load("res://scenes/ui/Heart.tscn")

func instantiate_hud():
	add_hearts()

func add_hearts():
	heart_container = $HeartContainer
	hearts = Global.player.max_hp / 4
	print(hearts)
	for n in hearts:
		var heart = heart_scene.instance()
		$HeartContainer.add_child(heart)
		heart.position = Vector2((16 * n) + HEART_OFFSET, HEART_OFFSET)
	fill_hearts()

func fill_hearts():
	var zero = false
	var hp = Global.player.current_hp
	for n in hearts:
		if zero:
			$HeartContainer.get_child(n).set_frame(0)
		else:
			if hp >= 4:
				$HeartContainer.get_child(n).set_frame(4)
				hp -= 4
			else:
				$HeartContainer.get_child(n).set_frame(hp)
				zero = true

func _ready():
	pass # Replace with function body.

