extends CharacterBody2D

func _physics_process(delta):
	var direction = Vector2.RIGHT
	
	velocity = direction * 100
	
	move_and_slide()
	
func hit():
	print("damage")
