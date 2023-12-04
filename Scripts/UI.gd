extends CanvasLayer

# Colors
var green: Color = Color("6bbfa3")
var red: Color = Color(0.1,0,0,1)

# Controls
@onready var laser_Counter: Label = $LaserCounter/VBoxContainer/Label
@onready var grenade_Counter: Label = $GrenadeCounter/VBoxContainer/Label
@onready var laser_icon: TextureRect = $LaserCounter/VBoxContainer/TextureRect
@onready var grenade_icon: TextureRect = $GrenadeCounter/VBoxContainer/TextureRect
@onready var health_bar: TextureProgressBar = $MarginContainer/TextureProgressBar

func _ready():
	Global.connect("stat_change", update_stat_text)
	update_stat_text()
	
func update_laser_text():
	laser_Counter.text = str(Global.laser_amount)
	update_color(Global.laser_amount, laser_Counter, laser_icon)

func update_grenade_text():
	grenade_Counter.text = str(Global.grenade_amount)
	update_color(Global.grenade_amount, grenade_Counter, grenade_icon)

func update_health_text():
	health_bar.value = Global.health

func update_color(amount: int, label: Label, icon: TextureRect) -> void:
	if amount == 0:
		label.modulate = red
		icon.modulate = red
	else :
		label.modulate = green
		icon.modulate = green

func update_stat_text() -> void:
	update_grenade_text()
	update_laser_text()
	update_health_text()
