extends RigidBody2D
const speed: int = 400

func explode():
	$AnimationPlayer.play("explosion")

