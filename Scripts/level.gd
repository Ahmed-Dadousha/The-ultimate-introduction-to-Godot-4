extends Node2D
class_name LevelParnet
# Preload laser and grenade scenes
var laser_scene: PackedScene = preload("res://Scenes/laser.tscn")
var grenade_scene: PackedScene = preload("res://Scenes/grenade.tscn")
var item_scene: PackedScene = preload("res://Scenes/item.tscn")


func _ready():
	for container in get_tree().get_nodes_in_group("Container"):
		container.connect("open", _on_container_opened)
	
func _on_container_opened(pos, direction):
	var item = item_scene.instantiate()
	item.position = pos
	item.direction = direction
	call_deferred("add_child", item)
	
func _on_player_laser(pos, direction):
	# Update Laser Amount
	Global.laser_amount -= 1
	$UI.update_laser_text()
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
	# Update Grenade Amount
	Global.grenade_amount -= 1
	$UI.update_grenade_text()
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
