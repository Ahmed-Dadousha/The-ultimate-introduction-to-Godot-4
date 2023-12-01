extends RigidBody2D
const speed: int = 600

func explode():
	$AnimationPlayer.play("explosion")

func _ready():
	$Explosion.visible = false
