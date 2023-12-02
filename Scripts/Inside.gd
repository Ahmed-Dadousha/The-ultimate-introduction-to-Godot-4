extends LevelParnet


func _on_exit_game_area_body_entered(_body):
	var tween = create_tween()
	tween.tween_property($player,"speed",0,0.5)
	call_deferred("teleport")
	
func teleport():	
	TransitionLayer.change_scene("res://Scenes/Outside.tscn")
