extends RigidBody2D
const speed: int = 700
var explosion_active: bool = false
var explosion_range: int = 300

func explode():
	$AnimationPlayer.play("explosion")
	explosion_active = true
	var targets = get_tree().get_nodes_in_group("Container") + get_tree().get_nodes_in_group("Entity")
	for target in targets:
		var in_range = target.global_position.distance_to(global_position)
		if "hit" in target  and in_range <= explosion_range:
			target.hit()

func _ready():
	$Explosion.visible = false
