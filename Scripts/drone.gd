extends CharacterBody2D

var active: bool = false
var health: int = 50
var speed: int = 0
var max_speed: int = 600
var speed_multiplier: int = 1
var explosion_active: bool = false
var explosion_range: int = 400
func _ready():
	$Explosion.hide()
	$Drone.show()

func _physics_process(delta):
	
	if active:
		look_at(Global.player_pos)
		var direction: Vector2 = (Global.player_pos - position).normalized()
		velocity = direction * speed * speed_multiplier
		
		var collison = move_and_collide(velocity * delta)
		
		if collison:
			$AnimationPlayer.play("explosion")
			explosion_active = true  
	
func hit():
	health -= 10
	$Drone.material.set_shader_parameter("progress",1)
	await get_tree().create_timer(.1).timeout
	$Drone.material.set_shader_parameter("progress",0)
	if health <= 0:
		stop_movement()
		$AnimationPlayer.play("explosion")

func _on_notice_area_body_entered(_body):
	active = true
	var tween: Tween = create_tween()
	tween.tween_property(self, "speed", max_speed, 6)

func _on_notice_area_body_exited(_body):
	active = false

func stop_movement():
	speed_multiplier = 0

func explode():
	if explosion_active:
		var targets = get_tree().get_nodes_in_group("Container") + get_tree().get_nodes_in_group("Entity")
		for target in targets:
			var in_range = target.global_position.distance_to(global_position) <= explosion_range
			if "hit" in target  and in_range :
				target.hit()
