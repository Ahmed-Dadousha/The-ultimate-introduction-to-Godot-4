extends Node

signal stat_change

var player_hit_sound: AudioStreamPlayer2D
var laser_amount: int = 20:
	set(value):
		laser_amount = value
		stat_change.emit()
var grenade_amount: int = 5:
	set(value):
		grenade_amount = value
		stat_change.emit()
var health: int = 50:
	get:
		return health
	set(value):
		if value < health:
			player_hit_sound.play()
		health = value
		stat_change.emit()
var player_pos: Vector2

func _ready():
	player_hit_sound = AudioStreamPlayer2D.new()
	player_hit_sound.stream = load("res://audio/solid_impact.ogg")
	add_child(player_hit_sound)
