extends CharacterBody2D

# Global Variables
var can_laser : bool = true
var can_grenade : bool = true

# Custem Signals
signal laser(pos, direction)
signal grenade(pos, direction)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var direction = Input.get_vector("left","right","up","down")
#	position += direction * 500 * delta
	velocity = direction * 500 
	
	# Rotate the player to mouse direction
	look_at(get_global_mouse_position())
	# Getting Player Direction
	var player_direction = (get_global_mouse_position() - position).normalized()	
	
	if Input.is_action_pressed("primary action") && can_laser:
		# Choose a random position for the laser
		var laser_markers = $LaserStartPositions.get_children()
		var selected_laser = laser_markers[randi() % laser_markers.size()]
	
		can_laser = false
		$laserTimer.start()		
		laser.emit(selected_laser.global_position, player_direction)
		
	if Input.is_action_pressed("secondary action") && can_grenade:
		# Choose the first marker position for the grenade
		var marker_pos = $LaserStartPositions.get_children()[0]
		
		can_grenade = false
		$grenadeTimer.start()

		grenade.emit(marker_pos.global_position, player_direction)
		
	move_and_slide()

func _on_grenade_timer_timeout():
	can_grenade = true

func _on_laserTimer_timeout():
	can_laser = true
