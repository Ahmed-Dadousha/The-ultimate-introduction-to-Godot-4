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

func _on_house_player_entered():
	var tween = get_tree().create_tween()
	tween.set_parallel(true)
	tween.tween_property($player/Camera2D,"zoom",Vector2(1,1),1)
	tween.tween_property($player,"modulate:a",0,2).set_trans(Tween.TRANS_QUAD)

func _on_house_player_exit():
	var tween = get_tree().create_tween()
	tween.tween_property($player/Camera2D,"zoom",Vector2(.5,.5),1)
	tween.tween_property($player,"modulate:a",1,2).set_trans(Tween.TRANS_QUAD)
