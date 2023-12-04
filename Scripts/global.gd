extends Node

signal stat_change

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
		health = value
		stat_change.emit()
var player_pos: Vector2
