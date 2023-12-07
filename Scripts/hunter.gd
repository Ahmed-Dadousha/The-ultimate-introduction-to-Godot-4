extends CharacterBody2D

@onready var player_near: bool = false
@onready var active: bool = false
var speed: int = 200

# Called when the node enters the scene tree for the first time.
func _ready():
	$NavigationAgent2D.target_position = Global.player_pos


func _physics_process(_delta):
	# To avoid Error
	await get_tree().physics_frame
	if active:
		$NavigationAgent2D.target_position = Global.player_pos
		look_at(Global.player_pos)
		var next_path_pos: Vector2 = $NavigationAgent2D.get_next_path_position()
		var direction: Vector2 = (next_path_pos - global_position).normalized()
		velocity = direction * speed
		move_and_slide()
	

func _on_notice_area_body_entered(_body):
	active = true


func _on_notice_area_body_exited(_body):
	active = false


func _on_attack_area_body_entered(_body):
	player_near  = true


func _on_attack_area_body_exited(_body):
	player_near = false

