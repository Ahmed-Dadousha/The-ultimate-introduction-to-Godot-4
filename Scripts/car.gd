extends PathFollow2D

var active: bool = false
@onready var line1: Line2D = $Turrent/RayCast2D/Line2D
@onready var line2: Line2D = $Turrent/RayCast2D2/Line2D
@onready var fire_gun1: Sprite2D = $Turrent/GunFire1
@onready var fire_gun2: Sprite2D = $Turrent/GunFire2

func fire():
	
	fire_gun1.modulate.a = 1
	fire_gun2.modulate.a = 1
	
	
	var tween = create_tween()
	tween.set_parallel(true)
	tween.tween_property(fire_gun1, "modulate:a",0,randf_range(0.1, 0.5))
	tween.tween_property(fire_gun2, "modulate:a",0,randf_range(0.1, 0.5))
	
	Global.health -= 20

func _ready():
	line2.add_point($Turrent/RayCast2D2.target_position )

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	progress_ratio += 0.02 * delta
	if active:
		$Turrent.look_at(Global.player_pos)

func _on_attack_area_body_entered(_body):
	active = true
	$AnimationPlayer.play("laser_load")
	
func _on_attack_area_body_exited(_body):
	active = false
	$AnimationPlayer.pause()
	var tween = create_tween()
	tween.set_parallel(true)
	tween.tween_property(line1, "width", 0, randf_range(0.1, 0.5))
	tween.tween_property(line2, "width", 0, randf_range(0.1, 0.5))
	await tween.finished
	$AnimationPlayer.stop()
