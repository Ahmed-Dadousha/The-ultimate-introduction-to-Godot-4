extends LevelParnet

func _on_gate_player_entered_gate():
	var tween = create_tween()
	tween.tween_property($player,"speed",0,.5)
	call_deferred("teleport")
	
func teleport():
	TransitionLayer.change_scene("res://Scenes/Inside.tscn")

func _on_player_update_state():
	$UI.update_laser_text()
	$UI.update_grenade_text()
	#$UI.update_health_text()
