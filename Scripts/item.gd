extends Area2D
var rotation_speed: int = 4
var avilable_options = ['laser', 'laser', 'laser', 'laser', 'grenade', 'health']
var type = avilable_options[randi() % len(avilable_options)]
var direction: Vector2
var distance: int = randi_range(150, 250)

func _ready():
	if type == 'laser':
		$Sprite2D.modulate = Color(0.1,0.2,0.8)
	elif type == 'grenade':
		$Sprite2D.modulate = Color(0.8,0.2,0.1)
	else :
		$Sprite2D.modulate = Color(0.1,0.8,0.2)

	# tween
	var target_pos = position + direction * distance
	var tween = create_tween()
	tween.set_parallel(true)
	tween.tween_property(self, "position", target_pos,.5)
	tween.tween_property(self,"scale", Vector2(1,1),.3).from(Vector2.ZERO)
func _process(delta):
	rotation += rotation_speed  * delta

func _on_body_entered(body):
	if body.is_in_group("player"):
		if type == 'laser':
			Global.laser_amount += 5
		elif type == 'grenade':
			Global.grenade_amount += 1
		elif type == "health":
			Global.health += 20
		queue_free()
