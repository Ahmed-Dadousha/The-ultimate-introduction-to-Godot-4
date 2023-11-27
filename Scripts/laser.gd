extends Area2D

var speed: int = 1000
var direction = Vector2.ZERO #(-1,0)

func _process(delta):
	position += direction * speed * delta
