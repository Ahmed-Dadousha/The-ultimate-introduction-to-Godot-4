extends LevelParnet




func _on_exit_game_area_body_entered(body):
	var tween = create_tween()
	tween.tween_property($player,"speed",0,0.5)
