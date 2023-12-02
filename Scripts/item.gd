extends Area2D
var rotation_speed: int = 4
var avilable_options = ['laser', 'laser', 'laser', 'laser', 'grenade', 'health']
var type = avilable_options[randi() % len(avilable_options)]

func _ready():
	if type == 'laser':
		$Sprite2D.modulate = Color(0.1,0.2,0.8)
	elif type == 'grenade':
		$Sprite2D.modulate = Color(0.8,0.2,0.1)
	else :
		$Sprite2D.modulate = Color(0.1,0.8,0.2)

func _process(delta):
	rotation += rotation_speed  * delta

func _on_body_entered(_body):
	if type == 'laser':
		Global.laser_amount += 5
	elif type == 'grenade':
		Global.grenade_amount += 1
	elif type == "health":
		Global.health += 20
	queue_free()
