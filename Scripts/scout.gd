extends CharacterBody2D

var player_nearby: bool = false
var can_laser: bool = true
var gun: bool = true
var health: int = 30
var vulnerable: bool = true

signal laser(pos, direction)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if player_nearby:
		look_at(Global.player_pos)
		if can_laser:
			var pos: Vector2 = $LaserSpawnPositions.get_child(gun).global_position
			gun = not gun
			var direction: Vector2 = (Global.player_pos - position).normalized()
			laser.emit(pos, direction)
			can_laser = false
			$Timers/LaserCoolDown.start()
			
func _on_attack_area_body_entered(_body):
	player_nearby = true

func _on_attack_area_body_exited(_body):
	player_nearby = false

func _on_laser_cool_down_timeout():
	can_laser = true

func hit():
	health -= 10
	$Sprite2D.material.set_shader_parameter("progress", 1)
	await  get_tree().create_timer(.2).timeout
	$Sprite2D.material.set_shader_parameter("progress", 0)
	if health <= 0:
		queue_free()

