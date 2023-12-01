extends LevelParnet
class_name ItemContainer

func _on_gate_player_entered_gate():
	var tween = create_tween()
	tween.tween_property($player,"speed",0,.5)
	get_tree().change_scene_to_file("res://Scenes/Inside.tscn")
