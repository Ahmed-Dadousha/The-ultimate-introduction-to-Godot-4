extends StaticBody2D
class_name ItemContainer

# Get The Direction of the Item
@onready var current_direction: Vector2 = Vector2.DOWN.rotated(rotation)
signal open(pos, direction)
var opened: bool = false	
