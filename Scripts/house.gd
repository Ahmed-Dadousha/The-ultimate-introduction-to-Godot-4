extends Area2D

signal player_entered
signal player_exit

func _on_body_entered(_body):
	player_entered.emit()


func _on_body_exited(_body):
	player_exit.emit()
