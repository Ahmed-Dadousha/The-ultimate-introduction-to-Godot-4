extends CanvasLayer



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	$LaserCounter/VBoxContainer/Label.text = str(Global.laser_amount)
	$GrenadeCounter/VBoxContainer/Label.text = str(Global.grenade_amount)
