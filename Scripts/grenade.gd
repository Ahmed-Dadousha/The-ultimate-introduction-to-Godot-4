extends RigidBody2D
const speed: int = 600
var explosion_active: bool = false
var explosion_range: int = 400
func explode():
	$AnimationPlayer.play("explosion")
	explosion_active = true

func _ready():
	$Explosion.visible = false

func _process(_delta):
	if explosion_active:
		var targets = get_tree().get_nodes_in_group("Container") + get_tree().get_nodes_in_group("Entity")
		for target in targets:
			var in_range = target.global_position.distance_to(global_position)
			if "hit" in target  and in_range <= explosion_range:
				target.hit()
