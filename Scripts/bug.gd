extends CharacterBody2D

var player_near: bool = false
var speed: int = 300
var active: bool = false
var health:int = 20

func hit():
	health -= 10	
	$AnimatedSprite2D.material.set_shader_parameter("progress", .9)
	$Particales/HitParticales.emitting = true
	await get_tree().create_timer(.3).timeout
	$AnimatedSprite2D.material.set_shader_parameter("progress", 0)
	$AudioStreamPlayer2D.play()
	if health <= 0:
		queue_free()

func _on_attack_area_body_entered(_body):
	player_near = true
	$AnimatedSprite2D.play("attack")

func _on_attack_area_body_exited(_body):
	player_near = false
	
func _on_noticed_area_body_entered(_body):
	active = true
	$AnimatedSprite2D.play("walk")
	
func _on_noticed_area_body_exited(_body):
	active = false
	$AnimatedSprite2D.stop()

func _on_animated_sprite_2d_animation_looped():
	if player_near:
		Global.health -= 10			

func _physics_process(_delta):
	if active:
		look_at(Global.player_pos)
		var direction = (Global.player_pos - position).normalized()
		velocity = direction * speed
		move_and_slide()

