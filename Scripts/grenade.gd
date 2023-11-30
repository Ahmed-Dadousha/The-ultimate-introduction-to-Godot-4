extends RigidBody2D
const speed: int = 750

func explode():
	$AnimationPlayer.play("explosion")

func _ready():
	$Explosion.visible = false
