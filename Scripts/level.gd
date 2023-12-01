extends Node2D

# Preload laser and grenade scenes
var laser_scene: PackedScene = preload("res://Scenes/laser.tscn")
var grenade_scene: PackedScene = preload("res://Scenes/grenade.tscn")

func _on_player_laser(pos, direction):
	# Create a new instance from laser scene
	var laser_instance = laser_scene.instantiate() as Area2D
	# Set its position randomly to one of the markers
	laser_instance.position = pos
	# Rotate laser to the player direction
	laser_instance.rotation = direction.angle()
	# make laser moves in the player direction
	laser_instance.direction = direction
	# laser_instance.rotation_degrees = rad_to_deg(direction.angle())
	# Add it to projectTiles node
	$ProjectTiles.add_child(laser_instance)

func _on_player_grenade(pos, direction):
	# Create a new instance from grenade scene
	var grenade_instance = grenade_scene.instantiate() as RigidBody2D
	# Set its position to one marker index 0
	grenade_instance.position = pos
	# Set its direction move
	grenade_instance.linear_velocity = direction * grenade_instance.speed
	# Add it to projectTiles node
	$ProjectTiles.add_child(grenade_instance)

func _on_house_player_entered():
	var tween = get_tree().create_tween()
	tween.set_parallel(true)
	tween.tween_property($player/Camera2D,"zoom",Vector2(1,1),1).from(1)
	tween.tween_property($player,"modulate:a",0,2).set_trans(Tween.TRANS_QUAD)

func _on_house_player_exit():
	var tween = get_tree().create_tween()
	tween.tween_property($player/Camera2D,"zoom",Vector2(.5,.5),1)

func _on_gate_player_entered_gate():
	var tween = create_tween()
	tween.tween_property($player,"speed",0,.5)
